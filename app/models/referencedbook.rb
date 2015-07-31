class Referencedbook < ActiveRecord::Base
	belongs_to :forum
	belongs_to :user
	belongs_to :book
end
