class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :roles, inverse_of: true
  accepts_nested_attributes_for :roles
  ROLES = %w[admin guest elder].freeze

  def role?(role)
    !!roles.find_by_name(role.to_s)
  end

end
