class LinksController < ApplicationController
  before_action :authenticate_user!

  def index
    @links = Link.all
  end

  def import
    Link.import(params[:file])
    redirect_to root_url, notice: "Links successfully imported."
  end
  
  def new
    redirect_to root_url, notice: "Only Teachers can import links" unless current_user.teacher?
  end


  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def link_params
      params.require(:link).permit(:week, :release_date, :title, :url)
    end
end
