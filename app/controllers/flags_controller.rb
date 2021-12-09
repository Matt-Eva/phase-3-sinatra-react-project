class FlagsController < ApplicationController

    post "/flags" do
        flag = Flag.create(user_id: params[:user_id], creation_id: params[:creation_id], value: params[:value])
        flag.to_json(only: [:id])
    end
    
    delete "/flags/:id" do
        flag = Flag.find(params[:id])
        flag.destroy
        {message: "Flag removed"}.to_json
    end
end