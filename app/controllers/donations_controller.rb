class DonationsController < ApplicationController

    post "/donations" do
        donation = Donation.create(user_id: params[:user_id], creation_id: params[:creation_id], amount: 1.00)
        {message: "Thank you for your donation!"}.to_json
    end
end