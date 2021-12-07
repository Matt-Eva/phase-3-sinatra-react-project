require "pry"

class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    creations = Creation.all
    creations.to_json
  end

  get "/users" do
    User.all.to_json
  end

  post "/current_users" do
    user = User.find_by(username: params[:username], password: params[:password])
    if user == nil
      "Could not find that user. Please enter a valid username and password.".to_json
    else
      user.to_json(only: [:id])
    end
  end

  post "/new_user" do
    user = User.find_by(username: params[:username])
    if user == nil
      new_user = User.create(username: params[:username], password: params[:password])
      new_user.to_json(only: [:id])
    else
      "Username already exists. Please create a unique username.".to_json
    end
  end

end
