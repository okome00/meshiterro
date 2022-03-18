Rails.application.routes.draw do
  # ルートパス（urlの一番最初 .com時のぺージ） => aboutページ
  root to: "homes#top"
  get 'homes/about' => 'homes#about', as: 'about'
  # Userモデル(devise：ユーザー認証機能)のルーディング
  devise_for :users

  # PostImageモデルのルーディング
  resources :post_images, only: [:new, :create, :index, :show, :destroy]
  # usersコントローラーのルーディング
  resources :users, only: [:show, :edit, :update]

end
