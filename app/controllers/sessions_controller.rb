class SessionsController < ApplicationController

  get '/login' do
    if logged_in?
      redirect '/listings'
    else
      erb :'sessions/login'
    end
  end

  post '/sessions' do
    login(params[:username], params[:password])
    redirect '/listings'
  end

  get '/logout' do
    logout!
    redirect '/'
  end
  
end