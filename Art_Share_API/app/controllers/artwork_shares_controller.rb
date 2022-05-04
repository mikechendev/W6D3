class ArtworkSharesController < ApplicationController
  def artwork_shares_params
    params.require(:artwork_share).permit(:artwork_id, :viewer_id)
  end
  def create
    @artwork_share = ArtworkShare.new(artwork_shares_params)
    if @artwork_share.save
      redirect_to users_url(@artwork_share.viewer_id)
    else
      artwork_share.errors.full_messages
    end
  end

  def destroy
    @artwork_share = ArtworkShare.find(params(:id))
    @artwork_share.destroy
    redirect_to users_url(@artwork_share.viewer_id)
  end
end
