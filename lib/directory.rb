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
    # binding.pry
    nav = prompt.select("These are your saved labels", labels)

if nav == "Back"
  user_home_page(user)
else
  your_chosen_label = nav.split(". ")[1]
  the_labels = Directory.where("label = ?", your_chosen_label)

  counter = 0
  choices = the_labels.map do |user_dir|
    # binding.pry
  tip = Tip.where("id = ?", user_dir.tip_id)[0]
  # binding.pry
"#{counter += 1}. #{tip.content}"

 end

 prompt = TTY::Prompt.new
 prompt.select(" ", choices)
 
end

 #check whether displayed labels belong to a single user
#check whether the displayed labels are in fact all the labels that this user has
#


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
