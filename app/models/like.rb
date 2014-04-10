class Like < ActiveRecord::Base
	belongs_to :user
	belongs_to :hack

	validates_uniqueness_of :user_id, :scope => [:hack_id]
end
