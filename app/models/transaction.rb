
class Transaction < ActiveRecord::Base
	# transactions belong to user
	acts_as_taggable
	belongs_to :user
end
