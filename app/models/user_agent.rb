class UserAgent < ActiveRecord::Base
  attr_accessible :get_count, :last_seen, :post_multiple_count, :post_single_count, :post_zero_count, :user_agent_string

  after_initialize do
    self.get_count ||= 0
    self.post_zero_count ||= 0
    self.post_single_count ||= 0
    self.post_multiple_count ||= 0
    self.last_seen ||= Time.zone.now.utc.iso8601
  end

  validates :user_agent_string, {
    :presence => true,
    :uniqueness => true,
    :allow_blank => false,
    :length => { :in => 5..255 },
  }
  validates :last_seen, {
    :presence => true,
    :allow_blank => false,
    :timeliness => {:format => 'yyyy-mm-ddThh:nn:ssZ'},
  }
  
  validates :get_count, :numericality => { :only_integer => true }
  validates :post_zero_count, :numericality => { :only_integer => true }
  validates :post_single_count, :numericality => { :only_integer => true }
  validates :post_multiple_count, :numericality => { :only_integer => true }
end
