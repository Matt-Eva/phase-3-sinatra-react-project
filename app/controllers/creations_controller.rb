class CreationsController < ApplicationController

    get "/" do
        creations = Creation.order_all
        creations.to_json(include: {user: {only: [:username, :id]}})
    end

    get "/fiction" do
        creations = Creation.where(category: "fiction")
        creations.to_json(include: {user: {only: [:username, :id]}})
    end

    get "/journalism" do
        creations = Creation.where(category: "journalism").sort_by{|a| -(a.ranking)}
        creations.to_json(include: {user: {only: [:username, :id]}})
    end

    get "/nonfiction" do
        creations = Creation.where(category: "nonfiction").sort_by{|a| -(a.ranking)}
        creations.to_json(include: {user: {only: [:username, :id]}})
    end

    get "/poetry" do
        creations = Creation.where(category: "poetry").sort_by{|a| -(a.ranking)}
        creations.to_json(include: {user: {only: [:username, :id]}})
    end

    post "/my_creations" do
        user = User.find(params[:id])
        creations = user.creations
        if creations == nil
            {message: "You haven't created anything yet"}
        else
            creations.to_json(include: {user: {only: [:username, :id]}})
        end
    end

    post "/creations" do
        creation = Creation.create({
            title: params[:title],
            content: params[:content],
            length: params[:length],
            category: params[:category],
            user_id: params[:user_id]
        })
        creation.to_json(only: [:id])
    end 

end