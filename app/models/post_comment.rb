class PostComment < ApplicationRecord
  belongs_to :user
  #コメント(PostComment)はユーザー(user)に属している(belongs_to)
  belongs_to :post_image
  #コメント(PostComment)は画像(post_image)に属している(belongs_to)
end
