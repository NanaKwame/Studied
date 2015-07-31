class Forum < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	has_many :referencedbooks
	has_many :likes, as: :liked

	def likedby(user_id)
		return Like.where(:user_id => user_id, :liked_id => self.id,  :liked_type => "Forum")
	end
end
