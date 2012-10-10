require 'spec_helper'

describe UserFilter do
  context "creations" do
    it "should be created from hash" do
      @user_filter = UserFilter.new(
        :login => "root",
        :user_status_id => user_statuses(:active_status).id,
        :created_at_since => "2010-08-23 12:51", :created_at_till => "2011-08-23 12:51")
      @user_filter.login.should == "root"
      @user_filter.user_status_id.should == user_statuses(:active_status).id
      @user_filter.created_at_since.to_s.should == "2010-08-23 12:51:00 +0400"
      @user_filter.created_at_till.to_s.should == "2011-08-23 12:51:00 +0400"
    end
  end

  context "validations" do
    it { should belong_to(:user_status) }
  end
end
