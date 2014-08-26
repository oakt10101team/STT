class LinksController < ApplicationController
  before_action :authenticate_user!

  def index
    @links = Link.all.page(params[:page]).per(10)
  end

  def import
    if params[:file].present?
      Link.import(params[:file])
      redirect_to root_url, notice: "Links successfully imported."
    else
      redirect_to new_link_path, alert: "No file selected."
    end
  end
  
  def new
    redirect_to root_url, notice: "Only Administrators can import links" unless current_user.administrator?
  end


  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def link_params
      params.require(:link).permit(:week, :release_date, :title, :url)
    end
end
