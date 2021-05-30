class User < ApplicationRecord
  has_many :posts
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_presence_of :first_name, :last_name, :phone
  validates_length_of :phone, is: 10, allow_blank: false
  validates_numericality_of :phone, only_integer: true

  def full_name
    last_name + ', ' + first_name
  end
end
