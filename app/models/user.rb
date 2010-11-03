class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # Include default devise modules. Others available are:
  # :http_authenticatable, :token_authenticatable, :lockable, :confirmable, :timeoutable and :activatable
  devise :registerable, :database_authenticatable, :recoverable,
         :rememberable, :trackable, :validatable

  has_and_belongs_to_many :roles

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation
  
  #def role?(role)
  #  return !!self.roles.find_by_name(role.to_s.camelize)
  #end
  
end
