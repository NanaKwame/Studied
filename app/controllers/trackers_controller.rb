class TrackersController < ApplicationController
  before_action :set_tracker, only: [:show, :edit, :update, :destroy]
  before_filter :deny_non_admin
  respond_to :html

  def index
    @trackers = Tracker.all
    respond_with(@trackers)
  end

  def show
    respond_with(@tracker)
  end

  def new
    @tracker = Tracker.new
    respond_with(@tracker)
  end

  def edit
  end

  def create
    prev_order = Tracker.where("book_id = '"+tracker_params[:book_id]+"' and user_id= '"+tracker_params[:user_id]+"'")
    if prev_order.length == 0
      order = Order.new(:user_id => tracker_params[:user_id] , :book_id => tracker_params[:book_id])
      order.save
    end
    @tracker = Tracker.new(tracker_params)
    @tracker.save
    redirect_to action: "index"
  end

  def update
    @tracker.update(tracker_params)
    respond_with(@tracker)
  end

  def destroy
    @tracker.destroy
    respond_with(@tracker)
  end

  private
    def set_tracker
      @tracker = Tracker.find(params[:id])
    end

    def tracker_params
      params[:tracker].permit(:user_id, :book_id, :end_time, :start_time)
    end
end
