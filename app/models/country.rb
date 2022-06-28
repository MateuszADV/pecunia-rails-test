class Country < ApplicationRecord
	has_many :currencies
	has_many :currency_units
	def to_s
		country_en
	end
	def to_s
		continent
	end
end
