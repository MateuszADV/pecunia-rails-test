class CurrencyUnit < ApplicationRecord
  belongs_to :country

  # validates_length_of :cod, minimum: 3, maximum: 3, allow_blank: true
  validates_format_of :cod, :with => /[A-Z]{3}/, allow_blank: true, message: "Max length 3, And all leter must big 'ABC'"
end
