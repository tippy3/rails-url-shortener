Rails.application.routes.draw do

  get '/' => 'home#index'
  get '/privacy' => 'home#privacy'

  get 'user/signup'
  get 'user/login'
  get 'user/mypage'
  get 'user/edit'

end
