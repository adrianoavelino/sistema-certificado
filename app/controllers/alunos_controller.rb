class AlunosController < ApplicationController

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

  private
  def aluno_params
    params.require(:aluno).permit(:nome, :ra)
  end
end
