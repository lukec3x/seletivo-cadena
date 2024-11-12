class Company < ApplicationRecord
  belongs_to :director
  has_many :employees
  has_many :service_orders
end
