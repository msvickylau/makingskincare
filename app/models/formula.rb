class Formula < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :ingredients
  accepts_nested_attributes_for :ingredients, :reject_if => :all_blank, :allow_destroy => true
  has_and_belongs_to_many :skinconcerns, -> { uniq }
  
  validates :title, :description, :category, :ingredients, :direction, presence: true

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

  def skinconcerns_attributes=(skinconcern_attributes)
    skinconcern_attributes.values.each do |skinconcern_attribute|
      skinconcern = Skinconcern.find_or_create_by(skinconcern_attribute)
      self.skinconcerns << skinconcern
    end
  end

  def self.last_five_formulas
    limit(5).order('created_at desc')
  end

  def self.by_user(user_id)
    where(user: user_id)
  end

  private

  def destroy_image?
    self.image.clear if @image_delete == "1"
  end

end
