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


  def edit_label(user)
    prompt = TTY::Prompt.new
    new_label = prompt.ask("What would you like to update your label as?")
    self.update(label: new_label)
    puts "Your label has been updated to #{new_label}."
    user_home_page(user)
  end


  def delete_label(user)
    prompt = TTY::Prompt.new
    gets = prompt.select("Are you sure?", %w[Yes No])
    if gets == "Yes"
      self.delete
      puts "This tip has been deleted"
      sleep 2
    end
    user_home_page(user)
  end


  def display_and_edit_tip(tip, user)
    system "clear"
    prompt = TTY::Prompt.new
    puts tip[0].name
    puts tip[0].content
    nav = prompt.select(" ", %w[Edit Delete Back])

    if nav == "Edit"
      edit_label(user)
    elsif nav == "Delete"
      delete_label(user)
    else
      user_saved_tips(user)
    end
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
        tip = Tip.where("id = ?", user_dir.tip_id)[0]
        "#{counter += 1}. #{tip.content}"
      end

      prompt = TTY::Prompt.new
      choice = prompt.select(' ', choices).split('. ')
      tip = Tip.where('content = ?', choice[1])
      binding.pry
      display_and_edit_tip(tip, user)
    end
  end

 #check whether displayed labels belong to a single user
#check whether the displayed labels are in fact all the labels that this user has
#

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
