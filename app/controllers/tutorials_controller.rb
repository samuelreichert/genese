class TutorialsController < ApplicationController
  layout 'landing_page'
  before_action :set_tutorial, only: [:show]
  skip_before_action :authenticate_user!

  # GET /tutorials
  # GET /tutorials.json
  def index
    @tutorials = Tutorial.all
  end

  # GET /tutorials/1
  # GET /tutorials/1.json
  def show
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_tutorial
    @tutorial = Tutorial.find(params[:id])
  end
end
