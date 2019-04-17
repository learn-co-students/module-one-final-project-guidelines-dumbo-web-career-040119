class Directory < ActiveRecord::Base
  belongs_to :tip
  belongs_to :user


  def auto_directory(new_dir)
    starting_tip_id = Tip.where('name = "Golden Rule"')[0].id
    new_dir.tip_id = starting_tip_id
    new_dir
  end


  def edit_label(tip, user)
    prompt = TTY::Prompt.new
    new_label = prompt.ask("What would you like to update your label to?")
    self.update(label: new_label)
    puts "Your label has been updated to #{new_label}."
    display_and_edit_tip(tip, user)
  end


  def delete_tip(tip, user)
    prompt = TTY::Prompt.new
    gets = prompt.select("Are you sure?", %w[Yes No])
    if gets == "Yes"
      self.delete
      puts "This tip has been deleted"
      sleep 3/2
    end
    user.user_saved_tips
  end


  def display_and_edit_tip(tip, user)
    system "clear"
    prompt = TTY::Prompt.new
    puts tip[0].name
    puts tip[0].content
    nav = prompt.select(" ", %w[Edit Delete Back])
    if nav == "Edit"
      edit_label(tip, user)
    elsif nav == "Delete"
      delete_tip(tip, user)
    else
      user.user_saved_tips
    end
  end

end
