class MatchesController < ApplicationController

  def create
    @match = Match.new(match_params)
    @match.offer = Offer.find(params[:offer_id])
    @match.save
    redirect_to offer_path(@match.offer)
  end

  def destroy
    @match = Match.find(params[:id])
    @match.destroy

    redirect_to offer_path(@match.offer)
  end

  private

  def match_params
    params.require(:match).permit(:start_date, :end_date, :status)
  end
end
