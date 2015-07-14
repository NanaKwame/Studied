class Book < ActiveRecord::Base
  has_many :authors
  has_many :tag_links
  has_many :tags, through: :tag_links
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/missing.png"
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
