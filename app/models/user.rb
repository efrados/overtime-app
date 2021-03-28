class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  validates_presence_of :first_name, :last_name

  def full_name
    last_name.upcase  + ", " +  first_name.upcase
  end
end
