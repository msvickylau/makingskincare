class Skinconcern < ActiveRecord::Base
  has_many :formula_skinconcerns
  has_many :formulas, :through => :formula_skinconcerns
  validates :name, uniqueness: { case_sensitive: false }
  before_save :downcase_fields

  def downcase_fields
    self.name.downcase!
  end

  def next  #finds next skinconcern in accending by name
    if next_skinconcern = self.class.order("name ASC").where("name > ?", name).first 
      next_skinconcern
    else
      self.class.order("name ASC").first
    end
  end

  def previous #finds previous skinconcern in descending by name
    if previous_skinconcern = self.class.order("name DESC").where("name < ?", name).first
      previous_skinconcern
    else
      self.class.order("name DESC").first
    end
  end

end
