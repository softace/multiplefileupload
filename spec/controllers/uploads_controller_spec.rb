require 'spec_helper'

shared_examples_for "any request" do
  it "returns http success and" do
    subject
    expect(response).to render_template('new')
    response.should be_success
  end
end

shared_examples_for "a request made by an unknown user agent" do |args|
  it_behaves_like "any request"
  it "creates a new record for the user agent" do
    expect { subject }.
      to change{ UserAgent.exists?(:user_agent_string => test_user_agent) }.
      from(false).to(true)
  end
  it "sets counter for #{args[:request_counter]} to == 1" do
    subject
    UserAgent.find_by_user_agent_string(test_user_agent).send(:"#{args[:request_counter]}_count").should == 1
  end
end

shared_examples_for "a request made by a known user agent" do |args|
  it_behaves_like "any request"
  it "increases the counter for #{args[:request_counter]}" do
    expect { subject }.
      to change{ UserAgent.find_by_user_agent_string(test_user_agent).send(:"#{args[:request_counter]}_count") }.
      by(1)
  end
end

describe UploadsController do
  let(:test_user_agent) { 'Rails Testing' }
  context "For a known user agent" do
    before(:all) do
      UserAgent.delete_all
      FactoryGirl.create(:user_agent, :user_agent_string => 'Rails Testing') 
    end
    
    describe "GET 'new'" do
      subject { get 'new_get' }
      it_behaves_like "a request made by a known user agent", {:request_counter => 'get'}
    end

    describe "POST 'new' without files" do
      subject { post 'new_post', :upload => {:files => [] } }
      it_behaves_like "a request made by a known user agent", {:request_counter => 'post_zero'}
    end

    describe "POST 'new' with a single file" do
      let(:test_file) { fixture_file_upload('/files/oneliner.txt', 'text/plain') }
      subject { post 'new_post', :upload => {:files => [test_file] } }
      it_behaves_like "a request made by a known user agent", {:request_counter => 'post_single'}
    end

    describe "POST 'new' with two files" do
      let(:test_file) { fixture_file_upload('/files/oneliner.txt', 'text/plain') }
      subject { post 'new_post', :upload => {:files => [test_file, test_file] } }
      it_behaves_like "a request made by a known user agent", {:request_counter => 'post_multiple'}
    end

  end

  context "For an unknown user agent" do
    before(:all) { UserAgent.delete_all }

    describe "GET 'new'" do
      subject { get 'new_get' }
      it_behaves_like "a request made by an unknown user agent", {:request_counter => 'get'}
    end

    describe "POST 'new' without files" do
      subject { post 'new_post', :upload => {:files => [] } }
      it_behaves_like "a request made by an unknown user agent", {:request_counter => 'post_zero'}
    end

    describe "POST 'new' with a single file" do
      let(:test_file) { fixture_file_upload('/files/oneliner.txt', 'text/plain') }
      subject { post 'new_post', :upload => {:files => [test_file] } }
      it_behaves_like "a request made by an unknown user agent", {:request_counter => 'post_single'}
    end

    describe "POST 'new' with two files" do
      let(:test_file) { fixture_file_upload('/files/oneliner.txt', 'text/plain') }
      subject { post 'new_post', :upload => {:files => [test_file, test_file] } }
      it_behaves_like "a request made by an unknown user agent", {:request_counter => 'post_multiple'}
    end
  end
end
