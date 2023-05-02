class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  def index
    @roles = Role.all
    if params[:user].present? and params[:user][:role_id].present?
      @role= Role.find_by_id(params[:user][:role_id])
      puts "==#{@role}=="
      @users = User.eager_load(user_roles: :role).where("roles.role =?", @role.role)
      "====#{@users}==="
      @details = []
      @users.each do|user|
        @name= user.name 
        @email = user.email
        @contact_no = user.contact_no
        @gender = user.gender
        @country = user.country
        @roles=user.user_roles
        @user_role_details = []
        @roles.each do|user_role|
          @user_role_details << user_role.role.role
        end
        @details << {:name=>@name, :email=>@email, :contact_no=>@contact_no,:gender=>@gender, :country=>@country, :user_roles_detailes=>@user_role_details,:user=>user}
      end  
    end
  end

  def show 
   @user = User.find(params[:id]) 
  end

  def new
    @user = User.new

  end

  def edit

  end
 
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end


  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  def delete_users
    User.where(id: params[:user_ids]).destroy_all
    redirect_to users_path, notice: "Users deleted successfully"
  end


  private
  def set_user
    @user= User.find(params[:id])
  end


  private
  def user_params
    params.require(:user).permit(:name, :email, :contact_no, :gender, :country, :role_id )
  end
end


 

