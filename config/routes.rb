Rails.application.routes.draw do


 devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
 }

 devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
 }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  devise_scope :customer do
   post 'customers/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end


  scope module: :public do
   get '/' => 'homes#top', as: 'top'
   get '/customers/sign_up' => 'registrations#new'
   post '/customers' => 'registrations#create'
   get '/customers/mypage' => 'customers#show'

   root to: 'spots#index'
   get 'search', to: 'spots#search'

   resources :comments, only:[:index, :new, :create, :edit, :update]
   resources :spots, expect: [:new, :create, :index, :show, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create]
   end
   resources :customers, only: [:show, :edit, :update] do
    get :favorites, on: :collection
   end
  end
  


 namespace :admin do

 get '/admin' => 'homes#top'
 delete '/comment/:id/destroy' => 'comment#destroy'
 # delete '/spots/:id' => 'spots#destroy', as: 'destroy_spot'
 resources :spots
 resources :customers
 resources :genres

 end

end

