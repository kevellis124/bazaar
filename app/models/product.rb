class Product < ApplicationRecord
  has_many :pictures
  # validates :name, presence: true
end
