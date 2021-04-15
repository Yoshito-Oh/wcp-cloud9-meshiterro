class PostImage < ApplicationRecord
  belongs_to :user
  #PostImageはuserに属している(belongs_to)
  attachment :image
  #PostImageは画像(image)をアップロード(attachment)できる
  has_many :post_comments, dependent: :destroy
  #ユーザー(User)は複数(has_many)のコメント(post_comments)を投稿でき、
  #ユーザーが消えたら(destroy)、一緒に(dependent)消える
  has_many :favorites, dependent: :destroy
  #ユーザー(User)は複数(has_many)のいいねト(favorites)を投稿でき、
  #ユーザーが消えたら(destroy)、一緒に(dependent)消える
  
  #validatesは入力必須項目
  validates :shop_name, presence: true
  validates :image, presence: true
  #shop_name, imageは入力しないとfalseとして返され、エラーメッセージが出る
  
  def favorited_by?(user)
    #faborited_by?メソッドは引数で渡されたユーザidが、
    #Favoritesテーブル内に存在(exists?)するか？を調べる
    #存在していればtrue, いなければfalse
    favorites.where(user_id: user.id).exists?
  end
end
