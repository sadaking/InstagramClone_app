class UsersController < ApplicationController
before_action :set_user, only: [:show, :edit, :update, :favorites]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_session_path(@user.id)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if current_user == @user
      if @user.update(user_params)
        flash[:success] = 'ユーザー情報を編集しました。'
        redirect_to user_path(@user.id)
      else
        flash.now[:danger] = 'ユーザー情報の編集に失敗しました。'
        render :edit
      end
      else
        redirect_to "users/new"
    end
  end

  def favorites
    @favorites = Favorite.where(user_id: @user.id)
  end

  def ensure_correct_user
    @user = User.find_by(id:params[:id])
    if @user.user_id != current_user.id
      flash[:notice] = "あなたには権限がありません！"
      redirect_to users_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation,
                                 :image)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
