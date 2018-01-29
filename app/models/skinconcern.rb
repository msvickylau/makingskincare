class Skinconcern < ActiveRecord::Base
  # has_many :skinconcern_formulas
  # has_many :formulas, through: :skinconcern_formulas
  has_and_belongs_to_many :formulas

  before_save :downcase_fields

  def downcase_fields
    self.name.downcase!
  end
end
