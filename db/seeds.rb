Day.destroy_all
Transaction.destroy_all

# SEED Days 
Day.create([
	{ budget: 100,
		transactions_sum: 10,
		user_id: 8,
		created_at: "2015-10-22 19:00:30.11476"
	},
	{ budget: 100,
		transactions_sum: 165,
		user_id: 8,
		created_at: "2015-10-23 19:00:30.11476"
	},
	{ budget: 100,
		transactions_sum: 20,
		user_id: 8,
		created_at: "2015-10-24 19:00:30.11476"
	},
	{ budget: 100,
		transactions_sum: 25,
		user_id: 8,
		created_at: "2015-10-25 19:00:30.11476"
	},	
	{ budget: 100,
		transactions_sum: 30,
		user_id: 8,
		created_at: "2015-10-26 19:00:30.11476"
	},
	{ budget: 100,
		transactions_sum: 35,
		user_id: 8,
		created_at: "2015-10-27 19:00:30.11476"
	},
	{ budget: 100,
		transactions_sum: 40,
		user_id: 8,
		created_at: "2015-10-28 19:00:30.11476"
	},
	{ budget: 100,
		transactions_sum: 45,
		user_id: 8,
		created_at: "2015-10-29 19:00:30.11476"
	},
	{ budget: 100,
		transactions_sum: 50,
		user_id: 8,
		created_at: "2015-10-30 19:00:30.11476"
	},
	{ budget: 100,
		transactions_sum: 55,
		user_id: 8,
		created_at: "2015-10-31 19:00:30.11476"
	},
	{ budget: 100,
		transactions_sum: 60,
		user_id: 8,
		created_at: "2015-11-01 19:00:30.11476"
	},
	{ budget: 100,
		transactions_sum: 65,
		user_id: 8,
		created_at: "2015-11-02 19:00:30.11476"
	},
	{ budget: 100,
		transactions_sum: 70,
		user_id: 8,
		created_at: "2015-11-03 19:00:30.11476"
	},
	{ budget: 100,
		transactions_sum: 75,
		user_id: 8,
		created_at: "2015-11-04 19:00:30.11476"
	},
	{ budget: 100,
		transactions_sum: 80,
		user_id: 8,
		created_at: "2015-11-05 19:00:30.11476"
	},
	{ budget: 100,
		transactions_sum: 85,
		user_id: 8,
		created_at: "2015-11-06 19:00:30.11476"
	},
	{ budget: 100,
		transactions_sum: 90,
		user_id: 8,
		created_at: "2015-11-07 19:00:30.11476"
	},
	{ budget: 100,
		transactions_sum: 95,
		user_id: 8,
		created_at: "2015-11-08 19:00:30.11476"
	},
	{ budget: 100,
		transactions_sum: 100,
		user_id: 8,
		created_at: "2015-11-09 19:00:30.11476"
	},
	{ budget: 100,
		transactions_sum: 105,
		user_id: 8,
		created_at: "2015-11-10 19:00:30.11476"
	},
	{ budget: 100,
		transactions_sum: 110,
		user_id: 8,
		created_at: "2015-11-11 19:00:30.11476"
	},
	{ budget: 100,
		transactions_sum: 115,
		user_id: 8,
		created_at: "2015-11-12 19:00:30.11476"
	},
	{ budget: 100,
		transactions_sum: 120,
		user_id: 8,
		created_at: "2015-11-13 19:00:30.11476"
	},
	{ budget: 100,
		transactions_sum: 125,
		user_id: 8,
		created_at: "2015-11-14 19:00:30.11476"
	},
	{ budget: 100,
		transactions_sum: 130,
		user_id: 8,
		created_at: "2015-11-15 19:00:30.11476"
	},
	{ budget: 100,
		transactions_sum: 135,
		user_id: 8,
		created_at: "2015-11-16 19:00:30.11476"
	},
	{ budget: 100,
		transactions_sum: 140,
		user_id: 8,
		created_at: "2015-11-17 19:00:30.11476"
	},
	{ budget: 100,
		transactions_sum: 145,
		user_id: 8,
		created_at: "2015-11-18 19:00:30.11476"
	},
	{ budget: 100,
		transactions_sum: 150,
		user_id: 8,
		created_at: "2015-11-19 19:00:30.11476"
	},
	{ budget: 100,
		transactions_sum: 55,
		user_id: 8,
		created_at: "2015-11-20 19:00:30.11476"
	},
	{ budget: 100,
		transactions_sum: 160,
		user_id: 8,
		created_at: "2015-11-21 19:00:30.11476"
	},
	{ budget: 100,
		transactions_sum: 15,
		user_id: 8,
		created_at: "2015-11-22 19:00:30.11476"
	}])

# seed transactions
 
Transaction.create([
	{ amount: 10,
		user_id: 8,
		created_at: "2015-10-22 20:32:42.486377",
		category: "Restaurants"
	},
	{ amount: 165,
		user_id: 8,
		created_at: "2015-10-23 20:32:42.486377",
		category: "Groceries"
	},
	{ amount: 20,
		user_id: 8,
		created_at: "2015-10-24 19:00:30.11476",
		category: "Transportation"	
	},
	{ amount: 25,
		user_id: 8,
		created_at: "2015-10-25 19:00:30.11476",
		category: "Entertainment"	
	},
	{ amount: 30,
		user_id: 8,
		created_at: "2015-10-26 19:00:30.11476",
		category: "Coffee"	
	},
	{ amount: 35,
		user_id: 8,
		created_at: "2015-10-27 19:00:30.11476",
		category: "Bars"	
	},
	{ amount: 40,
		user_id: 8,
		created_at: "2015-10-28 19:00:30.11476",
		category: "Household"	
	},
	{ amount: 45,
		user_id: 8,
		created_at: "2015-10-29 19:00:30.11476",
		category: "Clothing"	
	},
	{ amount: 50,
		user_id: 8,
		created_at: "2015-10-30 19:00:30.11476",
		category: "Personal"	
	},
	{ amount: 55,
		user_id: 8,
		created_at: "2015-10-31 19:00:30.11476",
		category: "Restaurants"	
	},
	{ amount: 60,
		user_id: 8,
		created_at: "2015-11-01 19:00:30.11476",
		category: "Groceries"	
	},
	{ amount: 65,
		user_id: 8,
		created_at: "2015-11-02 19:00:30.11476",
		category: "Transportation"	
	},
	{ amount: 70,
		user_id: 8,
		created_at: "2015-11-03 19:00:30.11476",
		category: "Entertainment"	
	},
	{ amount: 75,
		user_id: 8,
		created_at: "2015-11-04 19:00:30.11476",
		category: "Coffee"	
	},
	{ amount: 80,
		user_id: 8,
		created_at: "2015-11-05 19:00:30.11476",
		category: "Bars"	
	},
	{ amount: 85,
		user_id: 8,
		created_at: "2015-11-06 19:00:30.11476",
		category: "Household"	
	},
	{ amount: 90,
		user_id: 8,
		created_at: "2015-11-07 19:00:30.11476",
		category: "Clothing"	
	},
	{ amount: 95,
		user_id: 8,
		created_at: "2015-11-08 19:00:30.11476",
		category: "Personal"	
	},
	{ amount: 100,
		user_id: 8,
		created_at: "2015-11-09 19:00:30.11476",
		category: "Restaurants"	
	},
	{ amount: 105,
		user_id: 8,
		created_at: "2015-11-10 19:00:30.11476",
		category: "Groceries"	
	},
	{ amount: 110,
		user_id: 8,
		created_at: "2015-11-11 19:00:30.11476",
		category: "Transportation"	
	},
	{ amount: 115,
		user_id: 8,
		created_at: "2015-11-12 19:00:30.11476",
		category: "Entertainment"	
	},
	{ amount: 120,
		user_id: 8,
		created_at: "2015-11-13 19:00:30.11476",
		category: "Coffee"	
	},
	{ amount: 125,
		user_id: 8,
		created_at: "2015-11-14 19:00:30.11476",
		category: "Bars"	
	},
	{ amount: 130,
		user_id: 8,
		created_at: "2015-11-15 19:00:30.11476",
		category: "Household"	
	},
	{ amount: 135,
		user_id: 8,
		created_at: "2015-11-16 19:00:30.11476",
		category: "Clothing"	
	},
	{ amount: 140,
		user_id: 8,
		created_at: "2015-11-17 19:00:30.11476",
		category: "Personal"	
	},
	{ amount: 145,
		user_id: 8,
		created_at: "2015-11-18 19:00:30.11476",
		category: "Restaurants"	
	},
	{ amount: 150,
		user_id: 8,
		created_at: "2015-11-19 19:00:30.11476",
		category: "Groceries"	
	},
	{ amount: 55,
		user_id: 8,
		created_at: "2015-11-20 19:00:30.11476",
		category: "Transportation"	
	},
	{ amount: 160,
		user_id: 8,
		created_at: "2015-11-21 19:00:30.11476",
		category: "Entertainment"	
	},
	{ amount: 15,
		user_id: 8,
		created_at: "2015-11-22 19:00:30.11476",
		category: "Coffee"		
	}])


