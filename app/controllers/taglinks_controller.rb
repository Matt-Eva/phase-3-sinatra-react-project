class TaglinksController < ApplicationController

    delete "/taglink/:id" do 
        taglink = Taglink.find(params[:id])
        taglink.destroy
    end
end