
class Transaction < ActiveRecord::Base
	# transactions belong to user
	acts_as_taggable
	belongs_to :user

	validates :amount, :numericality => {:only_integer => true}, allow_nil: false



	


end
