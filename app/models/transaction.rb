class Transaction < ActiveRecord::Base
	# transactions belong to user
	belongs_to :user
end
