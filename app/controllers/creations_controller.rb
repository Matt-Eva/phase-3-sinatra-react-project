class CreationsController < ApplicationController

    get "/" do
        creations = Creation.order_all
        creations.to_json(include: {user: {only: [:username]}})
    end

    get "/fiction" do
        creations = Creation.where(category: "fiction")
        creations.to_json(include: {user: {only: [:username]}})
    end

    get "/journalism" do
        creations = Creation.where(category: "journalism").sort_by{|a| -(a.ranking)}
        creations.to_json(include: {user: {only: [:username]}})
    end

    get "/nonfiction" do
        creations = Creation.where(category: "nonfiction").sort_by{|a| -(a.ranking)}
        creations.to_json(include: {user: {only: [:username]}})
    end

    get "/poetry" do
        creations = Creation.where(category: "poetry").sort_by{|a| -(a.ranking)}
        creations.to_json(include: {user: {only: [:username]}})
    end

end