class LoansController < ApplicationController
  before_action :authenticate_user!#garantir que apenas usuários autenticados possam acessá-las.
  before_action :set_book, only: [:new, :create]
  before_action :set_loan, only: [:edit, :update, :show, :destroy]
  
  # Evita N+1
  def index
    @loans = current_user.loans.includes(:book)
  end

  #no index show usar datatable pensando na questão de muitos livros
  #Metodo de criar o emprestimo aonde ira fazer duas verificações
  #Primeiro se o livro ja esta emprestado
  #segunda se ele ja possui 3 livros emprestados
  def new
    @loan = Loan.new
  end

  def create
    if Loan.livro_emprestado?(@book)
      flash[:alert] = "Esse livro já foi emprestado!"
      redirect_to new_book_loan_path(@book)
    elsif Loan.emprestado_3?(current_user)
      flash[:alert] = "Você já possui três livros emprestados!"
      redirect_to new_book_loan_path(@book)
    else
      @loan = Loan.new(loan_params)
      @loan.user = current_user
      @loan.book = @book
      @loan.status = :emprestado

      if @loan.save
        redirect_to new_book_loan_path(@book), notice: "Empréstimo realizado!"
      else
        render :new
      end
    end
  end

  def update
    if @loan.update(status: :devolvido, data_devolucao_real: Date.today)
      flash[:notice] = "Livro devolvido com sucesso!"
      redirect_to book_loans_path(@loan.book)
    else
      render :edit
    end
  end

  def destroy
    @loan.destroy
    flash[:notice] = "Empréstimo excluído!"
    redirect_to user_loans_path(current_user)
  end

  private

  def set_loan
    @loan = Loan.find(params[:id])
  end

  def set_book
  @book = Book.find_by!(slug: params[:book_id])
rescue ActiveRecord::RecordNotFound
  flash[:alert] = "Livro não encontrado."
  redirect_to root_path
end
  def loan_params
    params.require(:loan).permit(:data_emprestimo, :data_devolucao_prevista)
  end
end
