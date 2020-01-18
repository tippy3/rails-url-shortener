Rails.application.routes.draw do

  get '/' => 'home#index'
  get '/privacy' => 'home#privacy'

  get '/login' => 'users#login'
  post '/login' => 'users#login_post'
  post '/logout' => 'users#logout_post'

  get '/signup' => 'users#signup'
  post '/signup' => 'users#signup_post'

  get '/mypage' => 'users#mypage'
  get '/settings' => 'users#edit'
  post '/settings' => 'users#edit_post'
  post '/settings/destroy' => 'users#destroy'

end
