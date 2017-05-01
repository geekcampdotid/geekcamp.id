Rails.application.routes.draw do

  root      to: 'pages#home',      as: :home
  get '2015' => 'pages#home_2015', as: :home_2015

  get '/cfp'      => 'pages#cfp',     as: :cfp
  get '/cfp/new'  => 'pages#new_cfp', as: :new_cfp

end
