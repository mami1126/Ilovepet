Rails.application.routes.draw do

 devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
 }

 devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
 }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  scope module: :public do

   get '/' => 'homes#top', as: 'top'
   get '/customers/mypage' => 'customers#show'
   resources :comments, only:[:index, :new, :create, :edit, :update]
   resources :customers, only:[:edit, :update]
   resources :salon, only:[:show, :index]
   resources :go_out, only:[:show, :index]

  end


 namespace :admin do

 get '/' => 'homes#top'
 delete '/comment/:id/destroy' => 'comment#destroy'

 resources :items, only:[:new, :show, :create, :index, :edit, :update]
 resources :go_out, only:[:show, :index]
 resources :salons, only:[:show, :index]
 resources :spot, only:[:new, :create, :edit, :update, :destroy]
 resources :customers, only:[:show, :index]


 end



end
