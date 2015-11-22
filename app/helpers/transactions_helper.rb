module TransactionsHelper

	def assign_icon(category)
		case category
			when "Restaurants"
				"img_link"
			when "Groceries"
				"img_link"
			when "Transport"
				"img_link"
			when "Entertainment"
				"img_link"
			when "Coffee"
				"img_link"
			when "Bars"
				"img_link"
			when "Household"
				"img_link"
			when "Clothing"
				"img_link"
			when "Personal"
				"img_link"
		end
	end
	
end

