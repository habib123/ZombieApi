class Zombie < ApplicationRecord
  validates :name, :age, :weight,:status, presence: true
  #attr_accessible :name, :age, :weight,:status
end
