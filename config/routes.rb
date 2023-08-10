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
   root to: 'public/homes#top'


  scope module: :public do
   get '/customers/sign_up' => 'registrations#new'
   post '/customers' => 'registrations#create'
   get '/customers/mypage' => 'customers#show'

  
   get 'search', to: 'spots#search'

   
   resources :spots, only: [:new, :create, :index, :show, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :comments
   end
   resources :customers, only: [:show, :edit, :update] do
    get :favorites, on: :collection
   end
  end



 namespace :admin do
  
 get 'search', to: 'spots#search'
 get '/admin' => 'homes#top'
 delete '/comment/:id/destroy' => 'comment#destroy'
 # delete '/spots/:id' => 'spots#destroy', as: 'destroy_spot'
 resources :spots
 resources :customers
 resources :genres
 end

end

