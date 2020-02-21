class UsuariosController < ApplicationController
    before_action :set_usuario, only: [:update, :destroy]
  def index
    @usuarios = Usuario.all
  end

  def new
    @usuario = Usuario.new
  end

  def create
    @usuario = Usuario.new(usuario_params)
    if @usuario.save
      redirect_to new_usuario_path, notice: "Administrador cadastrado com sucesso!"
    else
      render 'new'
    end
  end

  def edit
    @usuario = Usuario.find(params[:id])
  end

  def update
    if params[:usuario][:password].blank? && params[:usuario][:password_confirmation].blank?
      params[:usuario].extract!(:password, :password_confirmation)
    end
    if @usuario.update(usuario_params)
      redirect_to usuarios_path, notice: "Usuário atualizado com sucesso!"
    else
      render 'edit'
    end
  end

  def destroy
    if @usuario.destroy
      redirect_to usuarios_path, notice: "Usuário excluído com sucesso!"
    else
      render 'index'
    end
  end

  private
  def usuario_params
    params.require(:usuario).permit(:email, :password, :password_confirmation)
  end

  def set_usuario
    @usuario = Usuario.find(params[:id])
  end
end
