class AlunosController < ApplicationController
  before_action :set_aluno, only: [:update, :edit,:destroy]

  def index
    @alunos = Aluno.all
  end

  def new
    @aluno = Aluno.new
  end

  def create
    @aluno = Aluno.new(aluno_params)
    if @aluno.save
      redirect_to new_aluno_path, notice: 'Aluno cadastrado com sucesso!'
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @aluno.update(aluno_params)
      redirect_to alunos_path, notice: "Aluno atualizado com sucesso!"
    else
      render 'edit'
    end
  end

  def destroy
    if @aluno.destroy
      redirect_to alunos_path, notice: "Aluno excluído com sucesso!"
    else
      render 'index'
    end
  end

  private
  def aluno_params
    params.require(:aluno).permit(:nome, :ra)
  end

  def set_aluno
    @aluno = Aluno.find(params[:id])
  end
end
