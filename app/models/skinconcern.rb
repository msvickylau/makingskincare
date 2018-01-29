class Skinconcern < ActiveRecord::Base
  has_and_belongs_to_many :formulas
  validates :name, uniqueness: { case_sensitive: false }
  before_save :downcase_fields

  def downcase_fields
    self.name.downcase!
  end
end
