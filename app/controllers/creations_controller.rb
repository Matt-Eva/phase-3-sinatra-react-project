class CreationsController < ApplicationController

    get "/" do
        creations = Creation.order_all
        creations.to_json(include: [:taglinks, :tags, user: {only: [:username, :id]}])
    end

    get "/fiction" do
        creations = Creation.where(category: "fiction")
        creations.to_json(include: [:taglinks, :tags, user: {only: [:username, :id]}])
    end

    get "/journalism" do
        creations = Creation.where(category: "journalism").sort_by{|a| -(a.ranking)}
        creations.to_json(include: [:taglinks, :tags, user: {only: [:username, :id]}])
    end

    get "/nonfiction" do
        creations = Creation.where(category: "nonfiction").sort_by{|a| -(a.ranking)}
        creations.to_json(include: [:taglinks, :tags, user: {only: [:username, :id]}])
    end

    get "/poetry" do
        creations = Creation.where(category: "poetry").sort_by{|a| -(a.ranking)}
        creations.to_json(include: [:taglinks, :tags, user: {only: [:username, :id]}])
    end

    get "/my_creations/:id" do
        user = User.find(params[:id])
        creations = user.creations
        if creations == nil
            {message: "You haven't created anything yet."}.to_json
        else
            creations.to_json(include: [:taglinks, :tags, user: {only: [:username, :id]}])
        end
    end

    get "/search/:search" do
        creations = Creation.where(title: params[:search])
        if creations.length == 0
            {message: "Sorry! We couldn't find any writing that matched that search."}.to_json
        else
            creations.to_json(include: [:taglinks, :tags, user: {only: [:username, :id]}])
        end
    end

    get "/tag/:tag" do
        tag = Tag.find_by(tag: params[:tag])
        if tag == nil
            {message: "Sorry! That search didn't produce any results."}.to_json
        else
            creations = tag.creations.sort_by{|c| -(c.ranking)}.slice(0, 81)
            if creations.length == 0
                {message: "Sorry! That search didn't produce any results."}.to_json
            else
                creations.to_json(include: [:taglinks, :tags, user: {only: [:username, :id]}])
            end
        end
    end

    post "/creations/search" do
        creations = Creation.where(category: params[:category], title: params[:title])
        if creations.length == 0
            {message: "Sorry! We couldn't find any writing that matched that search."}.to_json
        else
            creations.to_json(include: [:taglinks, :tags, user: {only: [:username, :id]}])
        end
    end

    post "/creations/tag" do
        tag = Tag.find_by(tag: params[:tag])
        if tag == nil
            {message: "Sorry! That search didn't produce any results."}.to_json
        else
            creations = tag.creations.where(category: params[:category]).sort_by{|c| -(c.ranking)}.slice(0, 81)
            if creations.length == 0
                {message: "Sorry! That search didn't produce any results."}.to_json
            else
                creations.to_json(include: [:taglinks, :tags, user: {only: [:username, :id]}])
            end
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

    patch "/creations/:id" do
        creation = Creation.find(params[:id])
        creation.update(
            title: params[:title],
            content: params[:content],
            length: params[:length],
            category: params[:category],
            user_id: params[:user_id]
        )
        creation.to_json
    end

    delete "/creations/:id" do
        creation = Creation.find(params[:id])
        message = "#{creation.title} has been deleted."
        creation.destroy
        {message: message}.to_json
        end

end