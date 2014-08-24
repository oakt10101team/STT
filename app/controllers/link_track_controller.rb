class LinkTrackController < ApplicationController
  before_action :authenticate_user!

  def track_link
    current_user.link_tracks.create(link_id: params[:link_id])

    render nothing: true, status: 200
  end


  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def link_track_params
      params.require(:link_track).permit(:user_id, :link_id)
    end
end
