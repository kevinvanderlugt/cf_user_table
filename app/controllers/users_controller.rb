class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit]

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
      redirect_to @user
    else
      flash[:error] = "Unable to add user"
      render 'new'
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
