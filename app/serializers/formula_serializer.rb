class FormulaSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :direction, :image_file_name, :image_content_type, :image_file_size, :image_updated_at, :comment_list
  belongs_to :user
  belongs_to :category

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