class Skinconcern < ActiveRecord::Base
  has_many :formula_skinconcerns
  has_many :formulas, :through => :formula_skinconcerns
  validates :name, uniqueness: { case_sensitive: false }
  before_save :downcase_fields

  def downcase_fields
    self.name.downcase!
  end

  def next  #sort alph
    # how to add => unless name = "" or id == 0
    # @skinconcerns = Skinconcern.all.order("name ASC").select { |concern| !concern[:name].blank? }
    if next_skinconcern = self.class.order("name ASC").where("name > ?", name).first 
      next_skinconcern
    else
       Skinconcern.first
    end
  end

  def previous
    if previous_skinconcern = self.class.order("name ASC").where("name < ?", name).last
      previous_skinconcern
    else
      Skinconcern.last
    end
  end

end


