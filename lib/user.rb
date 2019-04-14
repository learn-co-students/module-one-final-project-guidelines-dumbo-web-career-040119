class User < ActiveRecord::Base
  has_many :directories
  has_many :tips, through: :directories

  def display_fav_tips
    counter = 0
    users_tips = Directory.where("user_id = ?", self.id)
    users_tips.map {|user_tip| user_tip = Tip.find(user_id)
      "#{counter += 1}. #{tip.content}"}
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
    system "clear"
    puts 'What is your username? ' + username
    password = self.set_password
    prompt = TTY::Prompt.new
    heart = prompt.decorate('❤ ', :red)
    confirm = prompt.mask('Please confirm your password?', mask: heart)
    if confirm != password
      puts('Your passwords do not match.')
      self.confirm_password(username)
    end
  end


  def self.set_email
    prompt = TTY::Prompt.new
    prompt.ask('What is your email?') do |q|
      q.validate(/\A\w+@\w+\.\w+\Z/) #copied from TTY prompt documentation
      q.messages[:valid?] = 'Invalid email address'
    end
  end


  # def nav
  #   prompt = TTY::Prompt.new
  #   prompt.yes?('Return to Landing Page?')
  # end


  def self.create_a_user
    username = self.set_username
    password = self.confirm_password(username)
    email = self.set_email

    guy = User.create(name: username, password: password, email: email)
    system 'clear'
    puts "Your username is #{username} and email is #{email}."
    sleep 3
    guy
    #end of this method needs to connect to a new Directory
    #get User color and audio preference
    #send intro email to the email address
  end

  def new_directory
    new_dir = Directory.create(user_id: self.id)
    new_dir.auto_directory(new_dir)
  end

end
