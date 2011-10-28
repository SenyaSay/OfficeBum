class Manager < User
  has_many :clients
  belongs_to :company
end