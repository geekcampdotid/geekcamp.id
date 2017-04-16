Rails.application.routes.draw do

  root to: 'pages#home'
  get '/cfp' => 'pages#cfp', as: :cfp
  get '2015' => 'pages#year_2015', as: :year_2015

end
