class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :note, optional: true
  belongs_to :coin, optional: true
  belongs_to :bond, optional: true

  validates :quantity ,presence:true, numericality: {only_integer: true}, exclusion: { in: [0] }
  validates :final_price , presence:true, numericality: {only_float: true}, :numericality => { :greater_than_or_equal_to => 0}


end
