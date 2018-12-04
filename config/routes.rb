Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :matters
  resources :teachers
  resources :students
  resources :courses
  get 'add_course_matters', to: 'courses#add_matters'
  post 'save_course_matters', to: 'courses#save_matters'
  get 'add_student_courses', to: 'students#add_courses'
  post 'save_student_courses', to: 'students#save_courses'
  get 'add_note', to: 'students#add_note'
  post 'students/save_note'
  root to: 'teachers#index'
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
    get 'students', to: 'students#list'
    end
  end
end
