class HomeController < ApplicationController
	before_filter :deny_non_admin, only: [:adminPage]

	def homepage
	end

	def catalogue
	end

	def myLibrary
	end

	def manageOrder
	end

	def forums
		@forums = Forum.all
	end

	def search
	end

	def adminPage

	end
end
