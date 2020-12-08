class UsersController < ApplicationController

  get '/listings' do
    if logged_in?
      @user = current_user
      
      erb :'/listings/index'
    else
      redirect '/login'
    end
  end 

end