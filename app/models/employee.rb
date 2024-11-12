class Employee < ApplicationRecord
  before_create :generate_authentication_token
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  belongs_to :company
  has_many :service_orders


  def generate_authentication_token
    self.authentication_token = SecureRandom.hex(20)
  end
end
