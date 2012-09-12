class NotNilValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add attribute, "can't be nil" if value.nil?
  end
end

class UserAgent < ActiveRecord::Base
  ##http://apidock.com/rails/v3.2.8/ActiveModel/Validations/ClassMethods/validates
  attr_accessible :get_count, :last_seen, :post_multiple_count, :post_single_count, :post_zero_count, :user_agent_string

  after_initialize do
 #   self.user_agent_string ||= ""
    self.get_count ||= 0
    self.post_zero_count ||= 0
    self.post_single_count ||= 0
    self.post_multiple_count ||= 0
    self.last_seen ||= Time.zone.now.utc.iso8601
  end

  validates :user_agent_string, {
    :uniqueness => true,
    :length => { :in => 0..255 },
    :not_nil => true
  }
  validates :last_seen, {
    :presence => true,
    :timeliness => {:format => 'yyyy-mm-ddThh:nn:ssZ'},
    :allow_blank => false,
  }
  
  validates :get_count, :numericality => { :only_integer => true }
  validates :post_zero_count, :numericality => { :only_integer => true }
  validates :post_single_count, :numericality => { :only_integer => true }
  validates :post_multiple_count, :numericality => { :only_integer => true }
end
