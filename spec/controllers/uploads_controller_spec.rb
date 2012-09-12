require 'spec_helper'

describe UploadsController do
  let(:test_user_agent) { 'Rails Testing' }
  context "For a known user agent" do
    before(:all) do
      UserAgent.delete_all
      FactoryGirl.create(:user_agent, :user_agent_string => 'Rails Testing') 
    end
    
    describe "GET 'new'" do
      before(:each) { get 'new'}

      it "returns http success and" do
        expect(response).to render_template('new')
        response.should be_success
      end

      it "increases number of user_agent records" do
        expect { get 'new' }.to change{ UserAgent.find_by_user_agent_string(test_user_agent).get_count }.from(1).to(2)
      end
    end

  end

  context "For an unknown user agent" do
    before(:all) do
      UserAgent.delete_all
    end

    describe "GET 'new'" do
      it "returns http success and" do
        get 'new'
        expect(response).to render_template('new')
        response.should be_success
      end
      
      it "creates a new record for an unknown user agent" do
        expect { get 'new' }.to change{ UserAgent.exists?(:user_agent_string => test_user_agent) }.from(false).to(true)
      end

      it "sets new records to have get_count = 1" do
        get 'new'
        UserAgent.find_by_user_agent_string(test_user_agent).get_count.should == 1
      end
    end

  end
end
