class UsuariosController < ApplicationController
  def index
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

  private
  def usuario_params
    params.require(:usuario).permit(:email, :password, :password_confirmation)
  end
end
