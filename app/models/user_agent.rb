class UserAgent < ActiveRecord::Base
  attr_accessible :get, :last_seen, :post_multiple, :post_single, :post_zero, :user_agent_string
  
  validates :user_agent_string, {
    :presence => true,
    :uniqueness => true,
    :allow_blank => false,
    :length => { :in => 5..255 }
  }
  validates :last_seen, {
    :presence => true,
    :allow_blank => false,
  }  
  validates :get, :numericality => { :only_integer => true }
  validates :post_zero, :numericality => { :only_integer => true }
  validates :post_single, :numericality => { :only_integer => true }
  validates :post_multiple, :numericality => { :only_integer => true }
end
