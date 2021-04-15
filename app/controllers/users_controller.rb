class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    #ログインしているユーザーidを探して(find)、@userに代入
    @post_images = @user.post_images.page(params[:page]).reverse_order
    #@そのユーザ(@user)に関連付けられた投稿(.post_images)のみ
    #@post_imagesに代入する。つまり全体ではなく個人の投稿のみを表示させる
  end
  def edit
    @user = User.find(params[:id])
    #ログインしているユーザーidを探して(find)、@userに代入
  end
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
