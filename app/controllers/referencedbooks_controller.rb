class ReferencedbooksController < ApplicationController
  before_action :set_referencedbook, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @referencedbooks = Referencedbook.all
    respond_with(@referencedbooks)
  end

  def show
    respond_with(@referencedbook)
  end

  def new
    @referencedbook = Referencedbook.new
    respond_with(@referencedbook)
  end

  def edit
  end

  def create
    @referencedbook = Referencedbook.new(referencedbook_params)
    @referencedbook.save
    respond_with(@referencedbook)
  end

  def update
    @referencedbook.update(referencedbook_params)
    respond_with(@referencedbook)
  end

  def destroy
    @referencedbook.destroy
    respond_with(@referencedbook)
  end

  private
    def set_referencedbook
      @referencedbook = Referencedbook.find(params[:id])
    end

    def referencedbook_params
      params[:referencedbook]
    end
end
