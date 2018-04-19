class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :formula_list

  def formula_list
    object.formulas.map do |formula|
      {
        id: formula.id,
        title: formula.title,
        user: {
          id: formula.user_id,
          username: User.find(formula.user_id).username
        },
        image_file_name: formula.image_file_name
        image_url: formula.image_url
      }
    end
  end
end
