Rails.application.routes.draw do

  root            to: 'pages#home',     as: :home
  get '/ticket'   => 'pages#ticket',    as: :ticket
  get '/2015'     => 'pages#home_2015', as: :home_2015

  get '/cfp'      => 'pages#cfp',       as: :cfp
  get '/cfp/new'  => 'pages#new_cfp',   as: :new_cfp

  get '/sponsor'  => 'pages#sponsor',   as: :sponsor

end
