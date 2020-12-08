require 'time'
class ListingsController < ApplicationController

  get '/listings' do
    if logged_in?
      @listings = Listing.all
      erb :'/listings/index'
    else
      flash[:error] = "Please log in"
      redirect '/login'
    end
  end

  get '/listings/new' do
    if logged_in?
      erb :'/listings/new'
    else
      flash[:error] = "Please log in"
      redirect '/login'
    end
  end

end