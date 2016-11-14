class User < ActiveRecord::Base
  # Include default users modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :confirmable
  validates :email ,:uniqueness => true, :presence => true
  validates :password, :presence => true
  validates :password_confirmation, :presence => true
  has_one :application , :dependent => :destroy

end
