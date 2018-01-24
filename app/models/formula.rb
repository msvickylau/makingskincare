class Formula < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :ingredients
   
  has_many :skinconcern_formulas
  has_many :skinconcerns, through: :skinconcern_formulas

  validates :title, :description, :direction, presence: true

  #paperclip, to add image file
  has_attached_file :image, styles: { :medium => "200x200#"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
