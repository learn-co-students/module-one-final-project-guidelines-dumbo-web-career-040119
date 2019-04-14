require 'colorize'
require 'artii'
require 'lolcat'

class CommandLineInterface
  def sign_up
    def set_username
      system 'clear'
      prompt = TTY::Prompt.new
      prompt.ask('What is your username?') do |q|
        q.required true
      end
    end

    def set_password
      prompt = TTY::Prompt.new
      heart = prompt.decorate('❤ ', :red)
      prompt.mask('What is your password?', mask: heart)
    end

    def confirm_password(username)
      system "clear"
      puts 'What is your username? ' + username
      password = set_password
      prompt = TTY::Prompt.new
      heart = prompt.decorate('❤ ', :red)
      confirm = prompt.mask('Please confirm your password?', mask: heart)
      if confirm != password
        puts('Your passwords do not match.')
        confirm_password(username)
      end
    end

    def set_email
      prompt = TTY::Prompt.new
      prompt.ask('What is your email?') do |q|
        q.validate(/\A\w+@\w+\.\w+\Z/)
        q.messages[:valid?] = 'Invalid email address'
      end
    end
    def nav
      prompt = TTY::Prompt.new
      prompt.yes?('Return to Landing Page?')
    end
    username = set_username
    password = confirm_password(username)
    email = set_email
    # User.new(name: username, password: password, email: email)
    puts "Your username is #{username} and email is #{email}. #{password}"
    input = nav
    input == true ? landing_page : exit
  end


  def log_in
    puts "Sorry I'm still working on this part"
    prompt = TTY::Prompt.new
    prompt.yes?('Go to Profile Page?')
  end

  def profile_page
    puts "This is where the user profile will go"
  end


  def exit
    system 'exit'
  end


  def landing_page
    system 'clear'
    prompt = TTY::Prompt.new
    logo = puts "//".colorize(:cyan) + " ♥".colorize(:red)
    art = puts <<-'EOF'
         _______________                        |*\_/*|________
        | |           | |    .****. .****.     | |           | |
        | |   0   0   | |    .*****.*****.     | |   0   0   | |
        | |     -     | |     .*********.      | |     -     | |
        | |   \___/   | |      .*******.       | |   \___/   | |
        | |___     ___| |       .*****.        | |___________| |
        |_____|\_/|_____|        .***.         |_______________|
          _|__|/ \|_|_.............*.............._|________|_
         / ********** \                          / ********** \
       /  ************  \                      /  ************  \
      --------------------                    --------------------
    EOF
    puts art
    puts logo
    system "artii Ruby Resources | lolcat"
    puts 'Welcome to Ruby Recources'
    nav = prompt.select('What would you like to do?', %w(Create Login Exit))
    if nav == "Create"
      sign_up
    elsif nav == "Login"
      log_in
    elsif nav == "Exit"
      exit
    end
  end
end
