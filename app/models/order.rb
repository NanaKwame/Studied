class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :book

  def cost
    self.calculated_timeused * 0.01
  end

  def calculated_timeused
    trackers = Tracker.where("book_id = '"+self.book_id.to_s+"' and user_id= '"+self.user_id.to_s+"'")
    total_time = 0
    for tracker in trackers
      total_time = total_time + ((tracker.end_time - tracker.start_time) / 3600).round
    end
    return total_time
  end

  def trackers
    trackers = Tracker.where("book_id = '"+self.book_id.to_s+"' and user_id= '"+self.user_id.to_s+"'")
    return trackers
  end
end
