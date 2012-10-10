require 'spec_helper'

describe AgentFilter do
  context "creations" do
    it "should be created from hash" do
      @agent_filter = AgentFilter.new(
        :name => "super name", :code => "super code",:about => "super about",
        :created_at_since => "2010-08-23 12:51", :created_at_till => "2011-08-23 12:51")
      @agent_filter.name.should == "super name"
      @agent_filter.code.should == "super code"
      @agent_filter.about.should == "super about"
      @agent_filter.created_at_since.to_s.should == "2010-08-23 12:51:00 +0400"
      @agent_filter.created_at_till.to_s.should == "2011-08-23 12:51:00 +0400"
    end
  end
end
