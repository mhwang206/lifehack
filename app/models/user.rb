class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :hacks
  has_many :likes
  has_many :liked_hacks, :through => :likes, :foreign_key => "hack_id", source: :hack
  has_many :comments
  has_many :followings
  has_many :followers, :through => :followings
  has_many :inverse_followings, :class_name => "Following", :foreign_key => "follower_id"
  has_many :inverse_followers, :through => :inverse_followings, :source => :user

	validates :name, presence: true  
end
