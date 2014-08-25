class LinkTrackController < ApplicationController
  before_action :authenticate_user!

  def track_link
    current_user.link_tracks.create(link_id: params[:link_id])

    render nothing: true, status: 200
  end

  def index
    if not current_user.teacher?
      redirect_to root_url, notice: "Only Teachers can see logs" 
      return
    end
    @link_tracks = LinkTrack.distinct_user_link_tracks.order('created_at DESC')
    @users   = User.all.order('created_at DESC')
  end


  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def link_track_params
      params.require(:link_track).permit(:user_id, :link_id)
    end
end
