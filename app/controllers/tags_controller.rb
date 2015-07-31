class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :edit, :update, :destroy]
  before_filter :deny_non_admin
  respond_to :html

  def index
    @tags = Tag.all
    respond_with(@tags)
  end

  def show
    respond_with(@tag)
  end

  def new
    @tag = Tag.new
    respond_with(@tag)
  end

  def edit
  end

  def create
    @tag = Tag.new(tag_params)
    @tag.save
    redirect_to :back
  end

  def update
    @tag.update(tag_params)
    respond_with(@tag)
  end

  def destroy
    @tag.destroy
    respond_with(@tag)
  end

  def addTag
    taggable = TagLink.new(:tag_id => params[:post][:tag_id] , :book_id => params[:book_id])
    taggable.save
    redirect_to :back
  end

  def removeTagLink
    taggable = TagLink.find(params[:id])
    taggable.destroy
    redirect_to :back
  end

  private
    def set_tag
      @tag = Tag.find(params[:id])
    end

    def tag_params
      params[:tag].permit(:name)
    end
end
