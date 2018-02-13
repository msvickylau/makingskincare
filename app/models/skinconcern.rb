class Skinconcern < ActiveRecord::Base
  has_many :formula_skinconcerns
  has_many :formulas, :through => :formula_skinconcerns
  validates :name, uniqueness: { case_sensitive: false }
  before_save :downcase_fields

  def downcase_fields
    self.name.downcase!
  end
end


