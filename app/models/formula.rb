class Formula < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :ingredients
  has_many :comments
  accepts_nested_attributes_for :ingredients, :reject_if => proc { |attributes| attributes['name'].blank? }, :allow_destroy => true
  
  has_many :formula_skinconcerns
  has_many :skinconcerns, :through => :formula_skinconcerns
  
  validates :title, :description, :category, :ingredients, :direction, :image, presence: true

  #paperclip, to add image file
  has_attached_file :image, styles: { :medium => "200x200#"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def image_url
    image.url(:medium)
  end

  def skinconcerns_attributes=(skinconcern_attributes)
    skinconcern_attributes.values.each do |skinconcern_attribute|
      new_skinconcern = Skinconcern.find_or_create_by(skinconcern_attribute)
      self.skinconcerns << new_skinconcern
    end
  end

  def self.last_five_formulas
    limit(5).order('created_at desc')
  end

  def self.by_user(user_id)
    where(user: user_id)
  end
end
