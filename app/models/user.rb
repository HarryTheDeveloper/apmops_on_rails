class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable
  include DeviseTokenAuth::Concerns::User

  has_many :bookmarks, dependent: :destroy
  has_many :crackeds, dependent: :destroy
  has_many :crackings, dependent: :destroy
  has_many :purchases
  has_many :solves, dependent: :destroy
end
