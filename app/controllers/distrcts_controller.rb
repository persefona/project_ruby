class DistrctsController < ApplicationController
  before_action :set_distrct, only: [:show, :edit, :update, :destroy]

  # GET /distrcts
  # GET /distrcts.json
  def index
    @distrcts = Distrct.all
  end

  # GET /distrcts/1
  # GET /distrcts/1.json
  def show
  end

  # GET /distrcts/new
  def new
    @distrct = Distrct.new
  end

  # GET /distrcts/1/edit
  def edit
  end

  # POST /distrcts
  # POST /distrcts.json
  def create
    @distrct = Distrct.new(distrct_params)

    respond_to do |format|
      if @distrct.save
        format.html { redirect_to @distrct, notice: 'Distrct was successfully created.' }
        format.json { render :show, status: :created, location: @distrct }
      else
        format.html { render :new }
        format.json { render json: @distrct.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /distrcts/1
  # PATCH/PUT /distrcts/1.json
  def update
    respond_to do |format|
      if @distrct.update(distrct_params)
        format.html { redirect_to @distrct, notice: 'Distrct was successfully updated.' }
        format.json { render :show, status: :ok, location: @distrct }
      else
        format.html { render :edit }
        format.json { render json: @distrct.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /distrcts/1
  # DELETE /distrcts/1.json
  def destroy
    @distrct.destroy
    respond_to do |format|
      format.html { redirect_to distrcts_url, notice: 'Distrct was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_distrct
      @distrct = Distrct.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def distrct_params
      params.require(:distrct).permit(:number, :voter, :invalid_vote, :ballot)
    end
end
