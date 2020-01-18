Rails.application.routes.draw do

  # home
  get '/' => 'home#index'
  get 'privacy' => 'home#privacy'

  # login, logout, signup
  get 'login' => 'users#login'
  post 'login' => 'users#login_post'
  post 'logout' => 'users#logout_post'
  get 'signup' => 'users#signup'
  post 'signup' => 'users#signup_post'

  # user
  get 'mypage' => 'users#mypage'
  post 'mypage' => 'urls#create'
  get 'settings' => 'users#edit'
  post 'settings' => 'users#edit_post'
  post 'settings/destroy' => 'users#destroy'

  # url
  get ':short_url/edit' => 'urls#edit'
  post ':short_url/edit' => 'urls#edit_post'
  post ':short_url/destroy' => "urls#destroy"
  get ':short_url' => 'urls#show'
  # create action is 'mypage'

end
