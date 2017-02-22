class OffersController < ApplicationController
  before_action :set_offer, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [ :search, :index, :show ]
  before_filter :current_user, only: [:edit, :destroy]

  def search
    q = "%#{params[:query]}%" # % only works with LIKE and ILIKE
    k = params[:num].to_i
    a = params[:age].to_i
    s = "#{params[:gender]}"
    @offers = Offer.where("city ILIKE ? and price < ? and age > ? and gender = ?", q, k, a, s)
  end

  def index
    @offers = Offer.all
  end

  def show
    @match = Match.new
  end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
    if @offer.save
      redirect_to offer_path(@offer)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @offer.update(offer_params)
    redirect_to offer_path(@offer)
  end

  def destroy
    @offer.destroy
    redirect_to offers_path
  end

  private

  def offer_params
    params.require(:offer).permit(:first_name, :age, :gender, :city, :price, :title, :description, :photo, :query)
  end

  def set_offer
    @offer = Offer.find(params[:id])
  end

end
