class Budget < ActiveRecord::Base

	# budget belongs to user
	belongs_to :user

end
