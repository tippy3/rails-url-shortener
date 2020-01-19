Rails.application.routes.draw do


  # home
  get '/' => 'home#index'
  get 'privacy' => 'home#privacy'

  # admin
  get 'admin/users'
  post 'admin/users/:id/destroy' => 'admin#user_destroy'
  get 'admin/users/:id' => 'admin#user_show'
  get 'admin/urls'

  # login, logout, signup
  get 'login' => 'users#login'
  post 'login' => 'users#login_post'
  post 'logout' => 'users#logout_post'
  get 'signup' => 'users#signup'
  post 'signup' => 'users#signup_post'

  # user
  get 'settings' => 'users#edit'
  post 'settings' => 'users#edit_post'
  post 'settings/destroy' => 'users#destroy'

  # url
  get 'mypage' => 'urls#new'
  post 'mypage' => 'urls#new_post'
  get ':short_url/qr' => 'urls#qr'
  get ':short_url/edit' => 'urls#edit'
  post ':short_url/edit' => 'urls#edit_post'
  post ':short_url/destroy' => "urls#destroy"
  get ':short_url' => 'urls#show'

end
