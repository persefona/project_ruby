class VoivodshipsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  before_action :set_voivodship, only: [:show, :edit, :update, :destroy]


  # GET /voivodships
  # GET /voivodships.json
  def index
    @voivodships = Voivodship.all
    @counts = Hash.new 
    @voivodships.each do |v|
      @counts[v.name] = set_count(v)
    end
  end

  # GET /voivodships/1
  # GET /voivodships/1.json
  def show
    set_result
    set_count(@voivodship)
  end

  # GET /voivodships/new
  def new
    @voivodship = Voivodship.new
  end

  # GET /voivodships/1/edit
  def edit
  end

  # POST /voivodships
  # POST /voivodships.json
  def create
    @voivodship = Voivodship.new(voivodship_params)

    respond_to do |format|
      if @voivodship.save
        format.html { redirect_to @voivodship, notice: 'Voivodship was successfully created.' }
        format.json { render :show, status: :created, location: @voivodship }
      else
        format.html { render :new }
        format.json { render json: @voivodship.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /voivodships/1
  # PATCH/PUT /voivodships/1.json
  def update
    respond_to do |format|
      if @voivodship.update(voivodship_params)
        format.html { redirect_to @voivodship, notice: 'Voivodship was successfully updated.' }
        format.json { render :show, status: :ok, location: @voivodship }
      else
        format.html { render :edit }
        format.json { render json: @voivodship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /voivodships/1
  # DELETE /voivodships/1.json
  def destroy
    @voivodship.destroy
    respond_to do |format|
      format.html { redirect_to voivodships_url, notice: 'Voivodship was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  #privateImage Uploading with the Paperclip Gem
    # Use callbacks to share common setup or constraints between actions.
    private
    def set_voivodship
      @voivodship = Voivodship.find(params[:id])
    end

    def set_result
      sum = 0
      @results = Hash.new
      @voivodship.committees.each do |c|
        @voivodship.votes.where("committee_id=?",c.id).each {|v| sum+=v.amount}
        @results[c.name] = sum
        sum = 0
      end
    end

    
    def set_count(voivodship)
      ballot = 0
      voter = 0
      voivodship.districts.each { |d| ballot+=d.ballot }
      voivodship.districts.each { |d| voter+=d.voter }
      @suma = (((ballot.to_f/voter.to_f)*100).round(2))
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def voivodship_params
      params.require(:voivodship).permit(:name)
    end
end
