class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :formula

  validates :content, presence: true
  
  accepts_nested_attributes_for :user, reject_if: :all_blank
end
