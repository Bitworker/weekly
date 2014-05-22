class Company < ActiveRecord::Base
  has_many :users
  
  accepts_nested_attributes_for :users
  
  validates :name, presence: true
  
  after_save :set_url_title
  
  def set_url_title
    url_name = self.name.squish.downcase.tr(" ", "_")
    self.update_column(:url_name, url_name)
  end
end
