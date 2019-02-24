Rails.application.routes.draw do

  root            to: 'pages#home',     as: :home

  get '/kode-etik'        => 'pages#kode_etik',       as: :kode_etik
  get '/code-of-conduct'  => 'pages#code_of_conduct', as: :code_of_conduct

  get '/cfp'      => 'pages#cfp',     as: :cfp
  get '/cfp/new'  => 'pages#new_cfp', as: :new_cfp

  get '/sponsor'  => 'pages#sponsor', as: :sponsor
  get '/ticket'   => 'pages#ticket',  as: :ticket

  get '/app'       => 'pages#apps',      as: :apps
  get '/get_there' => 'pages#get_there', as: :get_there

  get '/2017'       => 'pages_2017#home', as: :home_2017
  get '/2017/faces' => 'pages_2017#faces'

  get '/2015'       => 'pages_2015#home', as: :home_2015
# get '/2015/faces' => 'pages_2015#faces'

end
