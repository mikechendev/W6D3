class ArtworksController < ApplicationController
  def artwork_params
    params.require(:artwork).permit(:title, :image_url, :artist_id)
  end

  def index
    @artworks = User.find(params[:user_id]).artworks
    @shared = User.find(params[:user_id]).artwork_shares
    render json: { artworks: @artworks, shared: @shared }
  end

  def create
    @artwork = Artwork.new(artwork_params)
    if @artwork.save
      redirect_to artworks_url(@artwork)
    else
      artwork.errors.full_messages
    end
  end

  def show
    @artwork = Artwork.find(params[:id])
    redirect_to artworks_url(@artwork)
  end

  def destroy
    @artwork = Artwork.find(params[:id])
    @artwork.destroy
    redirect_to artworks_url
  end

  def update
    @artwork = Artwork.find(params[:id])
    @artwork.update(artwork_params)
    redirect_to artworks_url(@artwork)
  end

end
