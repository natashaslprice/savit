class Budget < ActiveRecord::Base

	# budget belongs to user
	belongs_to :user

	# only allow integers
	validates :net_wages, :numericality => {:only_integer => true} 
	validates :rent_mortgage, :numericality => {:only_integer => true}, allow_nil: true
	validates :car, :numericality => {:only_integer => true}, allow_nil: true
	validates :public_transportation, :numericality => {:only_integer => true}, allow_nil: true
	validates :insurance, :numericality => {:only_integer => true}, allow_nil: true
	validates :utilities, :numericality => {:only_integer => true}, allow_nil: true
	validates :internet, :numericality => {:only_integer => true}, allow_nil: true
	validates :cell_phone, :numericality => {:only_integer => true}, allow_nil: true
	validates :gym, :numericality => {:only_integer => true}, allow_nil: true
	validates :charity_donations, :numericality => {:only_integer => true}, allow_nil: true
	validates :student_loan, :numericality => {:only_integer => true}, allow_nil: true
	validates :credit_card, :numericality => {:only_integer => true}, allow_nil: true
	validates :other_expenses, :numericality => {:only_integer => true}, allow_nil: true

	
end
