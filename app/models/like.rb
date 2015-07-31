class Like < ActiveRecord::Base
	belongs_to :liked, polymorphic: true
	belongs_to :user
end
