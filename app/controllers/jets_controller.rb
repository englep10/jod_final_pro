class JetsController < ApplicationController
  before_action :set_jet, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @jets = Jet.all
    respond_with(@jets)
  end

  def show
    respond_with(@jet)
  end

  def new
    @jet = Jet.new
    respond_with(@jet)
  end

  def edit
  end

  def create
    @jet = Jet.new(jet_params)
    @jet.save
    respond_with(@jet)
  end

  def update
    @jet.update(jet_params)
    respond_with(@jet)
  end

  def destroy
    @jet.destroy
    respond_with(@jet)
  end

  private
    def set_jet
      @jet = Jet.find(params[:id])
    end

    def jet_params
      params.require(:jet).permit(:title, :make, :jet_model, :serial_number, :year, :price, :description)
    end
end
