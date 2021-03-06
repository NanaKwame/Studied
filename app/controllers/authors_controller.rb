class AuthorsController < ApplicationController
  before_action :set_author, only: [:show, :edit, :update, :destroy]
  before_filter :deny_non_admin, only: [:index, :show]
  respond_to :html

  def index
    @authors = Author.all
    respond_with(@authors)
  end

  def show
    respond_with(@author)
  end

  def new
    @author = Author.new
    respond_with(@author)
  end

  def edit
  end

  def create
    @author = Author.new(author_params)
    @author.save
    redirect_to :back
  end

  def update
    @author.update(author_params)
    respond_with(@author)
  end

  def destroy
    @author.destroy
    respond_with(@author)
  end

  private
    def set_author
      @author = Author.find(params[:id])
    end

    def author_params
      params[:author].permit(:firstName, :lastName, :book_id)
    end
end
