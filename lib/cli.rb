require 'colorize'
require 'artii'
require 'lolcat'

class CommandLineInterface
  def log_in
    puts "Sorry I'm still working on this part"
    prompt = TTY::Prompt.new
    prompt.yes?('Go to Profile Page?')
  end

  def profile_page
    puts "This is where the user profile will go"
  end


  def self.exit
    system 'exit'
  end


  def landing_page
    system 'clear'
    prompt = TTY::Prompt.new
    # logo = puts "//".colorize(:cyan) + " ♥".colorize(:red)
    # art = puts <<-'EOF'
    #      _______________                        |*\_/*|________
    #     | |           | |    .****. .****.     | |           | |
    #     | |   0   0   | |    .*****.*****.     | |   0   0   | |
    #     | |     -     | |     .*********.      | |     -     | |
    #     | |   \___/   | |      .*******.       | |   \___/   | |
    #     | |___     ___| |       .*****.        | |___________| |
    #     |_____|\_/|_____|        .***.         |_______________|
    #       _|__|/ \|_|_.............*.............._|________|_
    #      / ********** \                          / ********** \
    #    /  ************  \                      /  ************  \
    #   --------------------                    --------------------
    # EOF
    # puts art
    # puts logo
    # system "artii Ruby Resources | lolcat"
    puts 'Welcome to Ruby Recources'
    nav = prompt.select('What would you like to do?', %w(Create Login Exit))
    if nav == "Create"
      #insert a count
      new_user = User.create_a_user
      system 'clear'
      new_dir = new_user.new_directory
      system 'clear'
      new_dir.user_home_page(new_user)
    elsif nav == "Login"
      log_in
    elsif nav == "Exit"
      CommandLineInterface.exit
    end
  end
end
