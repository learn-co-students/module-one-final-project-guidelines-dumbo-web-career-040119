class Directory < ActiveRecord::Base
  belongs_to :tip
  belongs_to :user

  def auto_directory(new_dir)
    binding.pry
    new_dir.tip_id.where("name = ?", pry_tip.id)
    binding.pry
  end
end
