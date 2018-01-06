class Information < ApplicationRecord
  has_many :any_informations
  has_many :users, through: :any_informations
end
