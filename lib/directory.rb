class Directory < ActiveRecord::Base
  belongs_to :tip
  belongs_to :user

  def auto_directory(new_dir)
    starting_tip_id = Tip.where("name = 'Pry_Tip'")[0].id
    new_dir.tip_id = starting_tip_id
    new_dir
  end

  def home_page_tip
    Tip.where("id = #{self.tip_id}")[0].content
  end

  def user_home_page
    prompt = TTY::Prompt.new
    system 'clear'
    puts "Hello"
    nav = prompt.select("Here's your first tip: #{home_page_tip}", %w(More Saved Exit))
    if nav == "More"
      Tip.chosen_category
    else
      puts "Sorry bud this isn't done."
      sleep 3
      CommandLineInterface.exit
    end

  end

end
