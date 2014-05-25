class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  belongs_to :company
  accepts_nested_attributes_for :company
  
  validates :confirmation_token, uniqueness: true
  
  # Generate Teammembers without password
  def password_required?
    super unless self.role == :pending
  end
  
  def generate_confirmation_token
    Digest::SHA1.hexdigest("-wee-#{ BCrypt::Engine.generate_salt }-kly-")
  end
end
