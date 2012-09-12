# -*- coding: utf-8 -*-

FactoryGirl.define do
  
  factory :user_agent do
    user_agent_string "Not a real browser version 1.0"
    last_seen { 1.day.ago.iso8601 }
    get_count 0
    post_zero_count 0
    post_single_count 0
    post_multiple_count 0
  end
end
