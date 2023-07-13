Rails.application.routes.draw do


 devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
 }

 devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
 }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  devise_scope :user do
   post 'users/guest_sign_in', to: 'public/session#guest_sign_in'
  end


  scope module: :public do
   get '/' => 'homes#top', as: 'top'
   get '/customers/sign_up' => 'registrations#new'
   post '/customers' => 'registrations#create'
   get '/customers/mypage' => 'customers#show'
   
   root to: 'spots#index'
   get 'search', to: 'spots#search'
  
   resources :comments, only:[:index, :new, :create, :edit, :update]
   resources :spots

  end


 namespace :admin do

 get '/admin' => 'homes#top'
 delete '/comment/:id/destroy' => 'comment#destroy'

 resources :spots, only:[:show, :index, :new, :create, :edit, :update, :destroy]
 resources :customers
 resources :genres

 end



end
