class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy] # Adicionado para DRY

  def index
    @books = if params[:search]
               Book.where("title LIKE ? OR actor LIKE ?", 
                         "%#{params[:search]}%", 
                         "%#{params[:search]}%")
             else
               Book.all
             end
  end

  def show
   
  end

  def new 
    @book = Book.new
  end

  def create
    @book = Book.new(book_params) 
    
    if @book.save 
      flash[:notice] = "Livro criado com sucesso!"
      redirect_to root_path # Redireciona para a página do livro
    else
      flash.now[:alert] = "Erro ao criar livro!" # Adicionado feedback de erro
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
    
  end

  def update
    if @book.update(book_params)
      flash[:notice] = "Livro atualizado com sucesso!"
      redirect_to @book
    else
      flash.now[:alert] = "Erro ao atualizar livro!"
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @book.destroy
    flash[:notice] = "Livro removido com sucesso!"
    redirect_to books_path
  end

  private 

  def set_book
    @book = Book.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "Livro não encontrado"
    redirect_to books_path
  end

  def book_params
    params.require(:book).permit(:title, :actor, :editora, :ano_public) # Corrigido para singular (:book)
  end
end