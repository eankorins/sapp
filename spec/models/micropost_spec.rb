require 'spec_helper'

describe Micropost do
  let(:user) {FactoryGirl.create(:user)}
  before do
  	@micropost = Micropost.new(content: "Lorem psum", user_id: user.id)
  end
  subject{@micropost}
  it {should respond_to(:contet)}
  it {should respond_to(:user_id)}

  it{should_not be_valid}

  describe "when user_id is not present" do
  	before { @micropost.user_id	= nil}
  	it {should_not be_valid}
  end
end
