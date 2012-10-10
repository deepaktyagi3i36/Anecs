require 'spec_helper'

describe ArticleFilter do
  context "creations" do
    it "should be created from hash" do
      @article_filter = ArticleFilter.new(
        :code => "super code", :namel => "super name",
        :created_at_since => "2010-08-23 12:51", :created_at_till => "2011-08-23 12:51")
      @article_filter.code.should == "super code"
      @article_filter.namel.should == "super name"
      @article_filter.created_at_since.to_s.should == "2010-08-23 12:51:00 +0400"
      @article_filter.created_at_till.to_s.should == "2011-08-23 12:51:00 +0400"
    end
  end
end
