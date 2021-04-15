class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :post_images, dependent: :destroy
  #ユーザー(User)は複数(has_many)の画像(post_image)を投稿でき、
  #ユーザーが消えたら(destroy)、一緒に(dependent)消える
  has_many :post_comments, dependent: :destroy
  #ユーザー(User)は複数(has_many)のコメント(post_comments)を投稿でき、
  #ユーザーが消えたら(destroy)、一緒に(dependent)消える
  has_many :favorites, dependent: :destroy
  #ユーザー(User)は複数(has_many)のいいねト(favorites)を投稿でき、
  #ユーザーが消えたら(destroy)、一緒に(dependent)消える
  attachment :profile_image
  #Userはプロフィール画像(profile_image)をアップロード(attachment)できる
end
