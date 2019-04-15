class User < ActiveRecord::Base
  has_many :directories
  has_many :tips, through: :directories

  def display_fav_tips
    counter = 0
    users_tips = Directory.where('user_id = ?', id)
    users_tips.map do |_user_tip|
      user_tip = Tip.find(user_id)
      "#{counter += 1}. #{tip.content}"
    end
  end

  def self.set_username
    system 'clear'
    prompt = TTY::Prompt.new
    username = prompt.ask('What is your username?') do |q|
      q.required true
    end
    username
  end

  def self.set_password
    prompt = TTY::Prompt.new
    heart = prompt.decorate('❤ ', :red)
    prompt.mask('What is your password?', mask: heart)
  end

  def self.confirm_password(username)
    system 'clear'
    puts 'What is your username? ' + username
    password = set_password
    prompt = TTY::Prompt.new
    heart = prompt.decorate('❤ ', :red)
    confirm = prompt.mask('Please confirm your password?', mask: heart)
    if confirm != password
      puts('Your passwords do not match.')
      sleep 2
      confirm_password(username)
    end
  end

  def self.set_email
    prompt = TTY::Prompt.new
    prompt.ask('What is your email?') do |q|
      q.validate(/\A\w+@\w+\.\w+\Z/) # copied from TTY prompt documentation
      q.messages[:valid?] = 'Invalid email address'
    end
  end

  # def nav
  #   prompt = TTY::Prompt.new
  #   prompt.yes?('Return to Landing Page?')
  # end

  def self.create_a_user
    username = set_username
    password = confirm_password(username)
    email = set_email

    user = User.create(name: username, password: password, email: email)
    system 'clear'
    puts "Your username is #{username} and email is #{email}."
    sleep 3
    user
    # end of this method needs to connect to a new Directory
    # get User color and audio preference
    # send intro email to the email address
  end

  def new_directory
    new_dir = Directory.create(user_id: id)
    new_dir.auto_directory(new_dir)
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
    u_label = users_label
    u_comment = users_comment
    Directory.create(user_id: self.id, tip_id: tip.id, label: u_label, comment: u_comment)
    puts "Your tip has been saved"
    sleep 2
  end

  def chosen_tip(tip, nav)
    prompt = TTY::Prompt.new
    save_or_back = prompt.select('', %w[Save Back])
    if save_or_back == 'Save'
      save_tip(tip)
    end
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
    choices = ruby_tips.map {|tip| "#{counter += 1}. #{tip.name}"}
    choices.push("Back")
    system 'clear'
    choice = prompt.select("Choose a tip.", choices)
    if choice == "Back"
      category_search_page
    end
    tip = tip_result(choice)[0]
    chosen_tip(tip, nav)
  end

  def category_search_page
    system 'clear'
    prompt = TTY::Prompt.new
    nav = prompt.select("Which category would you like to view?", %w(Ruby Wellness Career Social Back))
    if nav == "Back"
      current_dir = Directory.where("user_id = ?", self.id).last
      current_dir.user_home_page(self)
    else
      category_tips(nav)
    end
  end

  def select_a_tip
    tip = category_search_page
    system 'clear'
    tip.map do |tip|
      puts tip.name
      puts tip.content
    end
    chosen_tip(tip[0])
  end
end
