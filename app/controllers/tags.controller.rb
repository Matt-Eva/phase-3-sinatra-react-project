class TagsController < ApplicationController

    post "/newtag" do
        tag = Tag.find_or_create_by(tag: params[:tag])
        taglink = Taglink.create(tag_id: tag.id, creation_id: params[:creation_id])
        taglink.to_json(include: [tag: {only: [:tag]}])
    end

end