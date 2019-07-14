Rails.application.routes.draw do
  root to: "tweets#index"
  get 'tweets' => 'tweets#index'
  get 'tweets/new' => 'tweets#new'
  post 'tweets' => 'tweets#create'
end
