class UsersController < ApplicationController
    before_action :set_user, only: [:update, :destroy]
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_user_path, notice: "Administrador cadastrado com sucesso!"
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      params[:user].extract!(:password, :password_confirmation)
    end
    if @user.update(user_params)
      redirect_to users_path, notice: "Usuário atualizado com sucesso!"
    else
      render 'edit'
    end
  end

  def destroy
    if @user.destroy
      redirect_to users_path, notice: "Usuário excluído com sucesso!"
    else
      render 'index'
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
