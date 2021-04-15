Rails.application.routes.draw do
  root 'post_images#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resource :favorites, only: [:create, :destroy]
    #単数形のresourceにすること！
    #そのコントローラのidがリクエストに含まれない
    #favoriteのshowページは不要のためidの受け渡しもないためresourceの単数形になってる
    resources :post_comments, only: [:create, :destroy]
    #post_commentsはpost_imagesに結びつくため直下に記載する
  end
  resources :users, only: [:show, :edit, :update]
  #usersコントローラにはshowアクションのみを定義するので、
  #onlyで不必要なルーティングを制限する
end
