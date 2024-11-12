class Company < ApplicationRecord
  belongs_to :director
  has_many :employees
end
