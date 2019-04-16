class User < ActiveRecord::Base
  has_many :directories
  has_many :tips, through: :directories

  def self.check_username(username)
    if all.map(&:name).include?(username)
      puts 'That username is taken'
      sleep 5 / 2
      set_username
    else
      username
    end
  end

  def self.set_username
    system 'clear'
    prompt = TTY::Prompt.new
    username = prompt.ask('What is your username?') do |q|
      q.required true
    end
    check_username(username)
  end

  def self.set_pw_page(username)
    system 'clear'
    puts 'What is your username? ' + username
  end

  def self.set_password
    prompt = TTY::Prompt.new
    heart = prompt.decorate('❤ ', :red)
    prompt.mask('What is your password?', mask: heart)
  end

  def self.validate_pw(confirm, password, username)
    if confirm != password
      puts('Your passwords do not match.')
      sleep 3 / 2
      confirm_password(username)
    end
  end

  def self.confirm_password(username)
    set_pw_page(username)
    password = set_password
    prompt = TTY::Prompt.new
    heart = prompt.decorate('❤ ', :red)
    confirm = prompt.mask('Please confirm your password?', mask: heart)
    validate_pw(confirm, password, username)
    password
  end

  def self.set_email
    prompt = TTY::Prompt.new
    prompt.ask('What is your email?') do |q|
      q.validate(/\A\w+@\w+\.\w+\Z/) # copied from TTY prompt documentation
      q.messages[:valid?] = 'Invalid email address'
    end
  end

  def self.user_setup(username, password, email)
    user = create(name: username, password: password, email: email)
    puts "Your username is #{username} and email is #{email}."
    sleep 3 / 2
    user
  end

  def self.create_a_user
    username = set_username
    password = confirm_password(username)
    email = set_email
    user_setup(username, password, email)
  end

  def self.check_password(username_query, password_query)
    user = where('name = ?', username_query)
    if user[0].password == password_query
      user = user[0]
      CommandLineInterface.temp_home_page(user)
    else
      CommandLineInterface.fail_pw_check(username_query)
    end
  end

  def self.check_name(username_query)
    if User.all.map(&:name).include?(username_query)
      CommandLineInterface.log_in_pw(username_query)
    else
      CommandLineInterface.fail_name_check
    end
  end

  def self.log_in(username_query, password_query)
    if !User.all.map(&:name).include?(username_query)
      puts 'That username does not match our records'
    elsif !User.where('name = ?', username_query).map(&:password).include?(password_query)
      puts 'Password is incorrect. Try again.'
    else
      User.select('name = ?', username_query && 'password = ?', password_query)
    end
  end

  def users_label
    prompt = TTY::Prompt.new
    users_label = prompt.ask('How would you like to label this tip?')
    users_label
  end

  def users_comment
    prompt = TTY::Prompt.new
    users_comment = prompt.ask("Is there any comment you'd like to add for youself?")
    users_comment
  end

  def save_tip(tip)
    label = users_label
    comment = users_comment
    Directory.create(user_id: id, tip_id: tip.id, label: label, comment: comment)
    puts 'Your tip has been saved'
    sleep 3 / 2
  end

  def chosen_tip(tip, nav)
    prompt = TTY::Prompt.new
    return if tip.nil?

    puts tip.content.to_s
    save_or_back = prompt.select('', %w[Save Back])
    save_tip(tip) if save_or_back == 'Save'
    category_tips(nav)
  end

  def tip_result(choice)
    choice_array = choice.split('. ')
    Tip.where('name = ?', choice_array[1])
  end

  def category_tips(nav)
    counter = 0
    prompt = TTY::Prompt.new
    ruby_tips = Tip.where('category = ?', nav)
    choices = ruby_tips.map { |tip| "#{counter += 1}. #{tip.name}" }
    choices.push('Back')
    system 'clear'
    choice = prompt.select('Choose a tip.', choices)
    category_search_page if choice == 'Back'
    tip = tip_result(choice)[0]
    chosen_tip(tip, nav)
  end

  def category_search_page
    system 'clear'
    prompt = TTY::Prompt.new
    nav = prompt.select('Which category would you like to view?', %w[Ruby Wellness Career Social Back])
    if nav == 'Back'
      CommandLineInterface.user_home_page(self)
    elsif nav == 'Wellness'
      WellnessCli.go(self)
    else
      category_tips(nav)
    end
  end

  def select_a_tip
    tip = category_search_page
    return if tip.nil?

    system 'clear'
    tip.map do |tip|
      puts tip.name
      puts tip.content
    end
    chosen_tip(tip[0])
  end

  def empty_directory
    puts "\n              Uh-oh...\n\n"
    puts '─────────▄▄───────────────────▄▄──'
    sleep 0.06
    puts '──────────▀█───────────────────▀█─'
    sleep 0.06
    puts '──────────▄█───────────────────▄█─'
    sleep 0.06
    puts  '──█████████▀───────────█████████▀─'
    sleep 0.06
    puts  '───▄██████▄─────────────▄██████▄──'
    sleep 0.06
    puts '─▄██▀────▀██▄─────────▄██▀────▀██▄'
    sleep 0.06
    puts '─██────────██─────────██────────██'
    sleep 0.06
    puts  '─██───██───██─────────██───██───██'
    sleep 0.06
    puts '─██────────██─────────██────────██'
    sleep 0.06
    puts '──██▄────▄██───────────██▄────▄██─'
    sleep 0.06
    puts  '───▀██████▀─────────────▀██████▀──'
    sleep 0.06
    puts  '──────────────────────────────────'
    sleep 0.06
    puts  '──────────────────────────────────'
    sleep 0.06
    puts  '──────────────────────────────────'
    sleep 0.06
    puts  '───────────█████████████──────────'
    sleep 0.06
    puts  '──────────────────────────────────'
    sleep 0.06
    puts  '──────────────────────────────────'
    puts "\n Looks like you haven't saved any tips yet!"
  end

  def get_user_labels(user)
    counter = 0
    all_users_tips = Directory.where('user_id = ?', user.id)
    users_labels = all_users_tips.map(&:label).uniq
    output = users_labels.map { |label| "#{counter += 1}. #{label}" }
    if counter == 0
      # Add an animation if ther are no saved tips#
      self.empty_directory
      puts 'You currently have no saved tips. Choose "More" to find new ones!'

      sleep 3
      CommandLineInterface.user_home_page(self)
    else
      output
    end
  end

  def user_saved_tips
    prompt = TTY::Prompt.new
    system 'clear'
    labels = get_user_labels(self)
    labels.push('Back')
    nav = prompt.select('These are your saved labels', labels)

    if nav == 'Back'
      CommandLineInterface.user_home_page(self)
    else
      your_chosen_label = nav.split('. ')[1]

      all_labels = Directory.where('label = ?', your_chosen_label)
      the_labels = all_labels.where('user_id = ?', id)
      counter = 0
      choices = the_labels.map do |user_dir|
        tip = Tip.where('id = ?', user_dir.tip_id)[0]
        "#{counter += 1}. #{tip.content}"
      end

      prompt = TTY::Prompt.new
      choice = prompt.select(' ', choices).split('. ')
      choice.delete_at(0)
      choice = choice.join('. ')
      tip = Tip.where('content = ?', choice)
      all_dir = Directory.where('tip_id = ?', tip[0].id)
      dir = all_dir.where('user_id = ?', id)
      dir[0].display_and_edit_tip(tip, self)
    end
  end
end
