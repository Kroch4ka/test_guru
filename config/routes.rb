Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/about', :to => redirect('about.html')
  get '/about/author', :to => redirect('author.html')
end
