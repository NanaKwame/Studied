class Author < ActiveRecord::Base
  belongs_to :book

  def fullName
  	return firstName+" "+lastName
  end
end
