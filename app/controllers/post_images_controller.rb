class PostImagesController < ApplicationController
  def new #画像投稿の画面を表示するアクションメソッド
    @post_image = PostImage.new
    #インスタンス変数にからのインスタンスを渡して画像の投稿ができるようにする
  end

  def create #投稿データを保存するアクションメソッド
   @post_image = PostImage.new(post_image_params)
   #post_image_paramsは、フォームで入力されたデータが投稿データとして
   #許可されているパラメータかどうかをチェック
   @post_image.user_id = current_user.id
  if  @post_image.save #PostImageモデルに保存ができたならば
   redirect_to post_images_path
   #リダイレクトして投稿画面一覧画面に戻る
  else #そうでなければ
    render :new
  end
  end

  def index
    #@post_images = PostImage.all
    #PostImageのすべてを@post_imagesに入れてindexに表示させる
    @post_images = PostImage.page(params[:page]).reverse_order
    #1ページ分の決められた数のデータだけを新しい順に取得するように変更した
  end

  def show #showアクションメソッドで詳細画面(show.html.erb)が表示されるように設定
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new
    #新しく@post_commentには空の新規コメント(PostComment.new)を入れる
  end

  def destroy
    @post_image = PostImage.find(params[:id])
    # post_image.id???番のページを探して、@post_imageに代入
    @post_image.destroy
    redirect_to post_images_path
    # 投稿一覧画面に戻る
  end

private
def post_image_params
  params.require(:post_image).permit(:shop_name, :image, :caption)
end

end
