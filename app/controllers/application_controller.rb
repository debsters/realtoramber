require './config/environment'
require 'sinatra/flash'
require 'pry'

class ApplicationController < Sinatra::Base
  #==================== CONFIGURATION =======================
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    register Sinatra::Flash
    enable :sessions
    set :session_secret, "amberrealtorapp"
  end
  #----------------------------------------------------------


  #==================== INDEX, ABOUT & 404 ===================
  get '/' do
    @listings = Listing.all
    erb :index
  end

  #----------------------------------------------------------


  #==================== HELPERS =============================
  helpers do

    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(:id => session[:user_id]) if session[:user_id]
    end

    def login(username, password)
      user = User.find_by(:username => username)
      if user && user.authenticate(password)
        session[:user_id] = user.id
      else
        redirect '/login'
      end
    end

    def logout!
      session.clear
    end

  end
  #----------------------------------------------------------

end