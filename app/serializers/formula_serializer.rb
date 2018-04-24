class FormulaSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :direction, :created_at, :updated_at, :image_file_name, :image_url, :comment_list
  has_one :user
  has_one :category

  def comment_list
    object.comments.map do |comment|
      {
        id: comment.id,
        user: {
          id: comment.user_id,
          username: User.find(comment.user_id).username
        },
        content: comment.content
      }
    end
  end
end