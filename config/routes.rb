Rails.application.routes.draw do

  root            to: 'pages#home',     as: :home
  get '/ticket'   => 'pages#ticket',    as: :ticket
  get '/2015'     => 'pages#home_2015', as: :home_2015

  get '/cfp'      => 'pages#cfp',       as: :cfp
  get '/cfp/new'  => 'pages#new_cfp',   as: :new_cfp

  get '/sponsor'  => 'pages#sponsor',   as: :sponsor

  get '/code-of-conduct'  => 'pages#code_of_conduct', as: :code_of_conduct
  get '/kode-etik'        => 'pages#kode_etik',       as: :kode_etik
  get '/app'  => 'pages#apps',   as: :apps
  get '/get_there'  => 'pages#get_there',   as: :get_there

end
