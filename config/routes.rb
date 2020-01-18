Rails.application.routes.draw do
  get 'user/signup'
  get 'user/login'
  get 'user/mypage'
  get 'user/edit'
  get 'home/index'
  get 'home/privacy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
