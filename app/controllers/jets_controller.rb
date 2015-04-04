class JetsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_jet, only: [:show, :edit, :update, :destroy]

  # GET /jets
  # GET /jets.json
  def index
    #if params[:category].blank?
      @jets = Jet.all.order("created_at DESC")
    #else
     # @category_id = Category.find_by(name: params[:category]).id
     # @jets = Jet.where(category_id: @category_id).order("created_at DESC")
   # end
  end

  # GET /jets/1
  # GET /jets/1.json
  def show
    @jet = Jet.find(params[:id])
    #@profiles = @jet.profiles
    @jets = Jet.all
  end

  # GET /jets/new
  def new
    @jet = Jet.new
  end

  # GET /jets/1/edit
  def edit
  end

  # POST /jets
  # POST /jets.json
    def create
    @jet = Jet.new(jet_params)
    @jet.user = current_user
    respond_to do |format|
      if @jet.save
        format.html { redirect_to @jet, notice: 'Jet was successfully created.' }
        format.json { render :show, status: :created, location: @jet }
      else
        format.html { render :new }
        format.json { render json: @jet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jets/1
  # PATCH/PUT /jets/1.json
  def update
    respond_to do |format|
      if @jet.update(jet_params)
        format.html { redirect_to @jet, notice: 'Jet was successfully updated.' }
        format.json { render :show, status: :ok, location: @jet }
      else
        format.html { render :edit }
        format.json { render json: @jet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jets/1
  # DELETE /jets/1.json
  def destroy
    @jet.destroy
    respond_to do |format|
      format.html { redirect_to jets_url, notice: 'Jet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jet
      @jet = Jet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def jet_params
     params.require(:jet).permit(:title, :make, :jet_model, :serial_number, :year, :price, :description)
    end
end