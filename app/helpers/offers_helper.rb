module OffersHelper
  def offer_photo_path(offer)
    if offer.photo?
      offer.photo.path
    else
      "squccvli7ttfx3fa4jnm"
    end
  end
end
