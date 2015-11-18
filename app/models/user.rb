class User < ActiveRecord::Base
  #dependecias
  #has_many :articles , dependent: :destroy
  #has_many :comments , dependent: :destroy
  #has_many :answers , dependent: :destroy
  #belongs_to :cart , dependent: :destroy
  
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable   

 def self.getCategory(param1)
    user=User.find(param1)
    
    if (!user.cantventas)or(user.cantventas < 100) 
      return "Bronce"
    elsif (user.cantventas>=100) and (user.cantventas<=500)
      return "Plata"
    else
      return "Oro"
    end
 end

 def self.getVentas(param1)
  user=User.find(param1)
  return user.cantventas
 end 

 def self.getCompras(param1)
  user=User.find(param1)
  return user.cantcompras
 end 

end
