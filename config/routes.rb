Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'hotdog#index'
  post '/upload', to: 'hotdog#upload'
end
