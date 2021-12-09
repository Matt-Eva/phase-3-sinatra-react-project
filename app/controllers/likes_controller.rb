class LikesController < ApplicationController

    post "/likes" do
        like = Like.create(user_id: params[:user_id], creation_id: params[:creation_id])
        like.to_json(only: [:id])
    end

    get "/likes/:id" do
        user = User.find(params[:id])
        likes = user.liked_creations
        likes.to_json(include: {user: {only: [:username, :id]}})
    end

    delete "/likes/:id" do
        like = Like.find(params[:id])
        like.destroy
        {message: "Like removed."}.to_json
    end

end