class Formula < ActiveRecord::Base
  belongs_to :user
  has_many :categories 
  has_many :formula_ingredient
  has_many :ingredients, through: :formula_ingredient

  validates :title, :description, :image, presence: true

  has_attached_file :image, styles: { :medium => "200x200#"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
