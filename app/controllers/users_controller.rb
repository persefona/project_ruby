class UsersController < ApplicationController
before_action :set_user, only: [:show, :edit, :update, :destroy]
before_action :set_districts, only:[:new, :create, :edit, :update]
#before_action :set_roles, only:[:new, :create, :edit, :update]

# GET /users
# GET /users.json
def index
	@users = User.all
end

# GET /users/1
# GET /users/1.json
def show
end

# GET /users/new
def new
	@user = User.new
	#@user.build_address
	
end

def create
	@user = User.new(user_params)
# Saving without session maintenance to skip
# auto-login which can't happen here because
# the User has not yet been activated
		if @user.save
			flash[:notice] = "Your account has been created."
			redirect_to voivodships_path
		else
			flash[:notice] = "There was a problem creating you."
			render :action => :new
		end
end

def edit
	@user = current_user
end
# PATCH/PUT /users/1
# PATCH/PUT /users/1.json
def update
	if params[:id]
		@user = User.find(params[:id])
	else
		@user = current_user
	end
	if @user.update_attributes(user_params)
		flash[:notice] = "Successfully updated profile."
		redirect_to admin_users_path
	else
		render :action => 'edit'
	end
end
# DELETE /users/1
# DELETE /users/1.json
def destroy
	@user.destroy
	respond_to do |format|
	format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
	format.json { head :no_content }
	end
end

private
	# Use callbacks to share common setup or constraints between actions.
	def set_user
		@user = User.find(params[:id])
	end

    def set_districts 
    	@districts = District.all.map do |district| 
    		[district.name + ' ' + district.voivodeship.name, district.id]
    	end
    end




    def set_roles 
    	@roles = Role.all.map do |role| 
    		[role.name, role.id] 
    	end
    end


    def user_params
      params.require(:user).permit(:name, :surname, :login,  :password, :password_confirmation, :email, :district_id)
    end
end



