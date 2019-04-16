require 'colorize'
require 'artii'
require 'lolcat'

class CommandLineInterface
  ##################  This is just for fun  #####################
  def self.logo_art
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
    puts logo
    puts art
  end


  ### Enabled here, as a class method - to be called anywhere ###
  def self.exit
    puts "❤  Come back soon ❤"
    sleep 3/2
    system 'exit'
    system 'clear'
  end


  ############# Next 4 methods pertain to login #################
  def self.fail_name_check
    puts "That name does not match our records"
    sleep 2
    system 'clear'
    self.logo_art
    prompt = TTY::Prompt.new
    nav = prompt.select('', %w(Retry? Back))
    if nav == "Retry?"
      self.log_in_name
    else
      self.landing_page
    end
  end

  def self.fail_pw_check(username_query)
    puts "Incorrect password"
    prompt = TTY::Prompt.new
    nav = prompt.select('', %w(Retry? Back))
    if nav == "Retry?"
      self.log_in_pw(username_query)
    else
      self.landing_page
    end
  end


  def self.log_in_name
    system 'clear'
    prompt = TTY::Prompt.new
    self.logo_art
    puts "\n"
    username_query = prompt.ask("Username:").downcase
    User.check_name(username_query)
  end


  def self.log_in_pw(username_query)
    system 'clear'
    self.logo_art
    puts "\n"
    puts "Username: " + username_query
    prompt = TTY::Prompt.new
    heart = prompt.decorate('❤ ', :red)
    password_query = prompt.mask("Password:", mask: heart).downcase
    User.check_password(username_query, password_query)
  end


  ##################### Main User Home Page #####################
  def self.user_home_page(user)
    prompt = TTY::Prompt.new
    system 'clear'
    puts "Hello"
    nav = prompt.select("\nHere's your first tip:\n#{Tip.where("id = 1")[0].content}\n", %w(More Saved Logout))
    if nav == "More"
      user.select_a_tip
    elsif nav == "Saved"
      user.user_saved_tips
    else
      CommandLineInterface.landing_page
    end
  end


  #################### Main App Landing Page ####################
  def self.landing_page
    system 'clear'
    self.logo_art
    system "artii Ruby Resources | lolcat"
    puts "\nWelcome to Ruby Recources"
    prompt = TTY::Prompt.new
    nav = prompt.select("\nWhat would you like to do?", %w(Create Login Exit))
    if nav == "Create"
      new_user = User.create_a_user
      user_home_page(new_user)
    elsif nav == "Login"
      self.log_in_name
    elsif nav == "Exit"
      CommandLineInterface.exit
    end
  end
end
