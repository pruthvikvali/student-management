class RolesController < ApplicationController
	def create
    @user = User.find(params[:user_id])
    @role = @user.roles.create(role_params)
    redirect_to user_path(@user)
  end
 
  private
    def role_params
      params.require(:role).permit(:role, :role_discription)
    end
end

