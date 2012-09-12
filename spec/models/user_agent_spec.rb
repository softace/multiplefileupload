require 'spec_helper'

describe UserAgent do
  it { should have_db_index(:user_agent_string) }
  it { should validate_uniqueness_of :user_agent_string }
  it { should validate_presence_of(:user_agent_string) }
  it { should ensure_length_of(:user_agent_string).is_at_least(5).is_at_most(255) }
  it { should validate_numericality_of(:get_count) }
  it { should validate_numericality_of(:post_zero_count) }
  it { should validate_numericality_of(:post_single_count) }
  it { should validate_numericality_of(:post_multiple_count) }
end
