class DistrictsController < ApplicationController
 before_filter :authenticate_user!
 load_and_authorize_resource
 before_action :set_district, only: [:show, :edit, :update, :destroy]
 before_action :set_voivodships, only: [:new, :create, :edit, :update]

  # GET /districts
  # GET /districts.json
  def index
    @districts = District.all
  end

  # GET /districts/1
  # GET /districts/1.json
  def show
    @vote_all = 0
    @district.votes.each do |v|
      @vote_all+=v.amount
    end

    if (@district.too_many_votes != nil )
    @vote_all+=@district.too_many_votes
    end

    if (@district.no_votes != nil )
    @vote_all+=@district.no_votes
    end

    if (@vote_all>@district.ballot) 
      @warring="Wprowadzono więcej głosów, niż wydano kart" 
    elsif (@vote_all<@district.ballot)
      @warring="Nie wprowadzono wszytkich głósów"
    end 
  end

  # GET /districts/new
  def new
    @district = District.new
  end

  # GET /districts/1/edit
  def edit
  end

  # POST /districts
  # POST /districts.json
  def create
    @district = District.new(district_params)

    respond_to do |format|
      if @district.save
        format.html { redirect_to @district, notice: 'District was successfully created.' }
        format.json { render :show, status: :created, location: @district }
      else
        format.html { render :new }
        format.json { render json: @district.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /districts/1
  # PATCH/PUT /districts/1.json
  def update
    respond_to do |format|
      if @district.update(district_params)
        format.html { redirect_to @district, notice: 'District was successfully updated.' }
        format.json { render :show, status: :ok, location: @district }
      else
        format.html { render :edit }
        format.json { render json: @district.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /districts/1
  # DELETE /districts/1.json
  def destroy
    @district.destroy
    respond_to do |format|
      format.html { redirect_to districts_url, notice: 'District was successfully destroyed.' }
      format.json { head :no_content }
    end
  end




  private
    # Use callbacks to share common setup or constraints between actions.
    def set_district
      @district = District.find(params[:id])
    end



    def set_voivodships
      @voivodships = Voivodship.all.map do |voivodship|
        [voivodship.name, voivodship.id]
      end
    end


      def district_params
      params.require(:district).permit(:number, :voter, :invalid_vote, :ballot, :voivodship_id, :voivodship, :too_many_votes, :no_votes)
    end
end
