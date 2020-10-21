Rails.application.routes.draw do
  devise_for :users
  root to: "prototypes#index"

  # commentsのrails routesでの一覧作成 ネストで親子関係記述
  # prototypesの中のcommentsということを確認する為
  resources :prototypes do
    resources :comments, only: :create
  end
  # ユーザー詳細ページ
  resources :users, only: :show
end