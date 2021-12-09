class LibItemsController < ApplicationController

    post "/lib_items" do
        lib_item = LibItem.create(user_id: params[:user_id], creation_id: params[:creation_id])
        lib_item.to_json(only: [:id])
    end

    get "/my_library/:id" do
        user = User.find(params[:id])
        library = user.favorites
        library.to_json(include: {user: {only: [:username, :id]}})
    end

    delete "/lib_items/:id" do
        lib_item = LibItem.find(params[:id])
        lib_item.destroy
        {message: "Removed from library"}.to_json
    end
end