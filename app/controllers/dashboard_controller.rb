class DashboardController < ApplicationController
  def index
    @user_matches = Match.where(user: current_user)
    @offer_matches = []
    Offer.where(owner: current_user).each do |offer|
      offer.matches.each do |match|
        @offer_matches << match
      end
    end
  end
end
