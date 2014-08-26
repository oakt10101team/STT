class LinkTrackController < ApplicationController
  before_action :authenticate_user!

  def track_link
    if params[:link_id].present?      
      current_user.link_tracks.create(link_id: params[:link_id])
    end

    render nothing: true, status: 200
  end

  def index
    if not current_user.administrator?
      redirect_to root_url, notice: "Only Administrators can see logs" 
      return
    end
    @link_tracks = LinkTrack.order('link_tracks.created_at DESC').includes(:user, :link).page(params[:tracks_page]).per(5)
    @users   = User.all.order('last_sign_in_at DESC').page(params[:user_page]).per(5)
  end


  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def link_track_params
      params.require(:link_track).permit(:user_id, :link_id)
    end
end
