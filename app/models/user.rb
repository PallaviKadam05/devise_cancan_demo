class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable#, :confirmable
#"devise :all, :except => :trackable"
#config.mailer_sender = "xyzpallavikadam0508@gmail.com"
  belongs_to :role, optional: true
 has_many :items
 validates_presence_of :name
 before_save :assign_role
 def assign_role
  self.role = Role.find_by name: "Regular" if self.role.nil?
 end
 def admin?
  self.role.name == "Admin"
end
def seller?
  self.role.name == "Seller"
end
def regular?
  self.role.name == "Regular"
end


end
