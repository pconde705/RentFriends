class OffersController < ApplicationController
  before_action :set_offer, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [ :search, :index, :show ]
  before_filter :current_user, only: [:edit, :destroy]

  def search
    c = "%#{params[:query]}%" # % only works with LIKE and ILIKE
    pr = params[:num].to_i
    # a = params[:age].to_i
    # g = "#{params[:gender]}" "and age > ? and gender = ?"
    @offers = Offer.where("city ILIKE ? and price < ?", c, pr)
  end

  def index
    @offers = Offer.all
  end

  def show

    if current_user
      all_renters = @offer.users
      @current_user_renting = all_renters.any? { |r| r.id == current_user.id }
    end

    @match = Match.new
    @hash = Gmaps4rails.build_markers(@offer) do |flat, marker|
      marker.lat flat.latitude
      marker.lng flat.longitude
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    end
  end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.owner = current_user
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
    params.require(:offer).permit(:first_name, :age, :gender, :city, :price, :title, :description, :photo, :query, :rules)
  end

  def set_offer
    @offer = Offer.find(params[:id])
  end

end
