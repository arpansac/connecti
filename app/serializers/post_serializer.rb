class PostSerializer < ActiveModel::Serializer
  
  attributes :id, :content, :user_id

  # belongs_to :user

  has_many :comments, serializer: CommentMinSerializer

end
