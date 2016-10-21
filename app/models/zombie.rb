class Zombie < ApplicationRecord
  validates :name, :age, :weight, :status, presence: true
end
