Rails.application.routes.draw do


  get 'doctor/index'

  get 'users/new'

  get 'user/new'

  get 'welcome/index'

  #post '/doctors', to: 'doctors#save', as: 'save_doctor'

  get '/blogs', to: 'blogs#index', as: 'blogs' 
  get '/blogs/new', to: 'blogs#new', as: 'new_blog'   
  get '/blogs/:id', to: 'blogs#show', as: 'blog'  
  post '/blogs', to: 'blogs#create', as: 'create_blog'  
  get '/blogs/:id/edit', to: 'blogs#edit', as: 'edit_blog'  
  patch '/blogs/:id', to: 'blogs#update', as: 'update_blog'  
  delete '/blogs/:id', to: 'blogs#destroy', as: 'delete_blog'  




  resources :doctors, only: [:index, :create, :update]

    resources :users do
    resources :roles
   end 

   resources :users do
   resources :live_classes
   end 



  resources :students

  resources :doctors do
  resources :patients
  end
  # get '/users/:user_id/live_classes/new', to: 'live_classes#new', as: 'new_live_class'
  # post '/users/:user_id/live_classes', to: 'live_classes#create', as: 'create_live_class'
  # get '/users/:user_id/live_classes/:id', to: 'live_classes#show', as: 'live_class'




  get 'docrors/index'

  get  '/users/:id' , to: 'users#show' , as: 'show_users'

  delete 'delet_students', to: 'students#delete_students' , as: :delete_students
  delete 'delete_users', to: 'users#delete_users', as: :delete_users
    
   root 'blogs#index' 


  end

















#def index
 #    @patients = Patient.all.map{ |p| [p.name, p.id] }
  #  if params[:patient_id].present?
  #    @patient = Patient.find(params[:patient_id])
  #    @doctors = @patient.doctors
  #  else
  #    @patient = nil
   #   @doctors = Doctor.all
   # end








   # <% if !@doctor.new_record? %>
   # <%= hidden_field_tag :id, @doctor.id %>
  # <% end %>
