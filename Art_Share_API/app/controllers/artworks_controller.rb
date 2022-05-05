class ArtworksController < ApplicationController

    def index
        @artworks = User.find(params[:user_id]).artworks
        @shared = User.find(params[:user_id]).artwork_shares
        render json: { artworks: @artworks, shared: @shared }
    end

    def create
        @artwork = Artwork.new(artwork_params)
        if @artwork.save!
            redirect_to artworks_url(@artwork)
        else
            render json: @artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        @artwork = Artwork.find(params[:id])
        render json: @artwork
    end

    def destroy
        @artwork = Artwork.find(params[:id])
        @artwork.destroy
        redirect_to artworks_url
    end

    def update
        @artwork = Artwork.find(params[:id])
        if @artwork.update(artwork_params)
            redirect_to artworks_url(@artwork)
        else
            render json: @artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    private

    def artwork_params
        params.require(:artwork).permit(:title, :image_url, :artist_id)
    end
end