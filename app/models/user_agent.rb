class UserAgent < ActiveRecord::Base
  attr_accessible :get_count, :last_seen, :post_multiple_count, :post_single_count, :post_zero_count, :user_agent_string
  
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
  validates :get_count, :numericality => { :only_integer => true }
  validates :post_zero_count, :numericality => { :only_integer => true }
  validates :post_single_count, :numericality => { :only_integer => true }
  validates :post_multiple_count, :numericality => { :only_integer => true }
end
