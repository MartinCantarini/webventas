class User < ActiveRecord::Base
  #dependecias
  has_many :articles , dependent: :destroy
  has_many :comments , dependent: :destroy
  has_many :answers , dependent: :destroy
  belongs_to :cart , dependent: :destroy
  
rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable   
end
