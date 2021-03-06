class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/missing.png"
  has_many :libraries
  has_many :orders
  has_many :forums
  has_many :comments
  has_many :trackers
  has_many :logs
  has_many :referencedbooks
  has_many :likes
  cattr_accessor :current_user

  def fullName
  	return firstName+" "+lastName
  end
end
