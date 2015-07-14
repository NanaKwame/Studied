class LibrariesController < ApplicationController
  before_action :set_library, only: [:show, :edit, :update, :destroy]
  before_filter :deny_non_admin
  respond_to :html

  def index
    @libraries = Library.all
    respond_with(@libraries)
  end

  def show
    respond_with(@library)
  end

  def new
    @library = Library.new
    respond_with(@library)
  end

  def edit
  end

  def create
    @library = Library.new(library_params)
    @library.save
    respond_with(@library)
  end

  def update
    @library.update(library_params)
    respond_with(@library)
  end

  def destroy
    @library.destroy
    respond_with(@library)
  end

  private
    def set_library
      @library = Library.find(params[:id])
    end

    def library_params
      params[:library].permit(:user_id, :book_id, :description)
    end
end
