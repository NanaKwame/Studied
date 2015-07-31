class Comment < ActiveRecord::Base
	belongs_to :forum
	belongs_to :user
	has_many :likes, as: :liked

	def likedby(user_id)
		return Like.where(:user_id => user_id, :liked_id => self.id,  :liked_type => "Comment")
	end
end
