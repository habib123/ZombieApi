class Role < ApplicationRecord
  has_and_belongs_to_many :users

  def self.admin
    can :manage, :all
  end
  def self.elder
    can :read, :all
    can :edit, User , id: user.id
  end
  def self.guest
    can :read, :all
  end

end
