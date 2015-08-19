class UsersController < ApplicationController
  before_action :signed_in_user, only: [:index, :show, :edit]
  before_action :correct_user, only:[:show, :update]
  before_action :admin_user, only: [:index]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = 'アカウト作成完了'
      redirect_to @user
    else
      render 'new'
    end
  end

  def update
    logger.debug '########'
    logger.debug user_params.inspect
    logger.debug '########'
    if @user.update_attributes(user_params)
      flash[:success] = '更新完了'
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
end
