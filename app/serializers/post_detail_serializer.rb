class PostDetailSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :updated_at, :comments_length


  belongs_to :user

  def comments_length
  	return object.comments.length
  end

end
