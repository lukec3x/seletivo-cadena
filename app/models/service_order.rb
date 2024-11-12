class ServiceOrder < ApplicationRecord
  enum status: { open: 0, in_progress: 1, completed: 2, inactive: 3 }

  belongs_to :employee
  belongs_to :company
end
