class Tip < ActiveRecord::Base
  has_many :directories
  has_many :users, through: :directories

  def self.chosen_category
    system 'clear'
    prompt = TTY::Prompt.new
    nav = prompt.select("Which category would you like to view?", %w(Ruby Wellness Career Social))
    if nav == "Ruby"
      counter = 0
      prompt = TTY::Prompt.new
      ruby_tips = Tip.where('category = "Ruby"')
      choices = ruby_tips.map {|tip| "#{counter += 1}. #{tip.name}"}
      prompt.select("Choose a tip.", choices)
      sleep 5
      CommandLineInterface.exit
    else
      #Need to seed Tips
      puts "We have no other tips for you."
    end
  end

  # def users_label
  #   puts "What label would you like to save this tip by?"
  #   users_label = gets.strip.downcase
  #   return users_label
  # end
  #
  # def users_comment
  #   puts "Is there any comment you'd like to add?"
  #   users_comment = gets.strip.downcase
  #   return users_comment
  # end
  #
  # def save_it
  #   puts "Would you like to save this tip?"
  #   users_comment = gets.strip.downcase
  #   if users_comment == "Yes".downcase
  #     save_tip_to_dir(label)
  #   elsif users_comment == "NO".downcase
  #     #some method to go back to menu or see next tip
  #   else
  #     puts "please write 'yes' or 'no'"
  #   end
  # end
  #
  # def chosen_type
  #   puts "Which category would you like to view?"
  #   puts #here types
  #   chosen_type = gets.strip.downcase
  #     #we have to write that 1. Ruby == 1 == 1. == Ruby
  #   return chosen_type
  # end

end
