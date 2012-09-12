require 'spec_helper'

describe UserAgent do
  it { should have_db_index(:user_agent_string) }
  it { should validate_uniqueness_of :user_agent_string }
  it { should ensure_length_of(:user_agent_string).is_at_most(255) }
  it { should allow_value("").for(:user_agent_string) }
  it { should_not allow_value(nil).for(:user_agent_string) }
  it { should validate_numericality_of(:get_count) }
  it { should validate_numericality_of(:post_zero_count) }
  it { should validate_numericality_of(:post_single_count) }
  it { should validate_numericality_of(:post_multiple_count) }

  it { should allow_value(Time.zone.now.iso8601).for(:last_seen) }
  it { should allow_value(Time.zone.now.utc.iso8601).for(:last_seen) }
  it { should_not allow_value("/12/12/2012").for(:last_seen) }
  it { should_not allow_value("12:30").for(:last_seen) }
  its(:last_seen) { should be_within(1).of(Time.zone.now) }
  its(:get_count) { should == 0 }
  its(:post_zero_count) { should == 0 }
  its(:post_single_count) { should == 0 }
  its(:post_multiple_count) { should == 0 }
  
  describe "a specific instance" do
    let!(:user_agent) do
      FactoryGirl.create(:user_agent,
                         :get_count => 100,
                         :post_zero_count => 100,
                         :post_single_count => 100,
                         :post_multiple_count => 100,
                         :last_seen => 1.hour.ago,
                         )
    end
    subject { user_agent.reload }
    its(:last_seen) { should be_within(1.second).of(1.hour.ago) }
    its(:get_count) { should == 100 }
    its(:post_zero_count) { should == 100 }
    its(:post_single_count) { should == 100 }
    its(:post_multiple_count) { should == 100 }
  end
end
