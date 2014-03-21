class Hack < ActiveRecord::Base
	# attr_accessible :hack_file_name

	belongs_to :user

	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }

	validates :image, presence: true
	validates :description, presence: true
end
