class ForumsController < ApplicationController
  before_action :set_forum, only: [:show, :edit, :update, :destroy]
  before_filter :deny_non_admin, only: [:index]
  respond_to :html

  def index
    @forums = Forum.all
    respond_with(@forums)
  end

  def show
    respond_with(@forum)
  end

  def new
    @forum = Forum.new
    respond_with(@forum)
  end

  def edit
  end

  def create
    @forum = Forum.new(forum_params)
    @forum.save
    redirect_to :back
  end

  def update
    @forum.update(forum_params)
    respond_with(@forum)
  end

  def destroy
    @forum.destroy
    respond_with(@forum)
  end

  private
    def set_forum
      @forum = Forum.find(params[:id])
    end

    def forum_params
      params[:forum].permit(:user_id, :title, :description)
    end
end
