class Tag < ActiveRecord::Base
  has_many :tag_links
  has_many :books, through: :tag_links
end
