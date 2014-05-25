class Interest < ActiveRecord::Base
  validates :email, presence: true
  validates :email, uniqueness: true
end
