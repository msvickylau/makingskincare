class Formula < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :ingredients
  # accepts_nested_attributes_for :ingredients, reject_if: proc { |attributes| attributes['name'].blank? }
  accepts_nested_attributes_for :ingredients, :reject_if => :all_blank, :allow_destroy => true

  has_many :skinconcern_formulas
  has_many :skinconcerns, through: :skinconcern_formulas
  accepts_nested_attributes_for :skinconcerns, reject_if: proc { |attributes| attributes['name'].blank? }

  validates :title, :description, :direction, :category, presence: true

  #paperclip, to add image file
  has_attached_file :image, styles: { :medium => "200x200#"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/


  before_save :destroy_image?

  def image_delete
    @image_delete ||= "0"
  end

  def image_delete=(value)
    @image_delete = value
  end

  private

  def destroy_image?
    self.image.clear if @image_delete == "1"
  end

end
