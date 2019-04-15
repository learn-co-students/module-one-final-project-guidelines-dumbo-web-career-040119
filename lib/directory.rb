class Directory < ActiveRecord::Base
  belongs_to :tip
  belongs_to :user

  def auto_directory(new_dir)
    starting_tip_id = Tip.where('name = "Golden Rule"')[0].id
    new_dir.tip_id = starting_tip_id
    new_dir
  end

  def home_page_tip
    Tip.where("id = #{self.tip_id}")[0].content
  end

  def get_user_labels(user)
    counter = 0
    all_users_tips = Directory.where("user_id = ?", user.id)
    users_labels = all_users_tips.map(&:label).uniq
    users_labels.map {|label| "#{counter += 1}. #{label}"}
  end

  def user_saved_tips(user)
    prompt = TTY::Prompt.new
    system 'clear'
    labels = get_user_labels(user)
    labels.push("Back")
    binding.pry
    nav = prompt.select("These are your saved labels", labels)
    
  end

  def user_home_page(user)
    prompt = TTY::Prompt.new
    system 'clear'
    puts "Hello"
    #We'll make the below line better
    nav = prompt.select("Here's the tip of the day:\n#{home_page_tip}", %w(More Saved Exit))
    if nav == "More"
      user.select_a_tip
    elsif nav == "Saved"
      user_saved_tips(user)
    else
      CommandLineInterface.exit
    end
  end

end
