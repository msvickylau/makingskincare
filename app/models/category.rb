class Category < ActiveRecord::Base
  has_many :formulas

    def next  
    if next_category = self.class.where("id > ?", id).first
      next_category
    else
       Category.first
    end
  end

  def previous
    if previous_category = self.class.where("id < ?", id).last
      previous_category
    else
      Category.last
    end
  end
end
