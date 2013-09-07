class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "User was added"
      redirect_to users_url
    else
      flash[:error] = "Unable to add user"
      render 'new'
    end
  end

  def update
    if @user.update(user_params)
      flash[:success] = "User was updated"
      redirect_to users_url
    else
      flash[:error] = "Unable to update user"
      render 'edit'
    end
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :phone, :email)
    end

    def find_user
      @user = User.find(params[:id])
    end
end
