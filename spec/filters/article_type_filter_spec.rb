require 'spec_helper'

describe ArticleTypeFilter do
  context "creations" do
    it "should be created from hash" do
      @article_type_filter = ArticleTypeFilter.new(
        :name => "super name", :code => "super code",:about => "super about",
        :created_at_since => "2010-08-23 12:51", :created_at_till => "2011-08-23 12:51")
      @article_type_filter.name.should == "super name"
      @article_type_filter.code.should == "super code"
      @article_type_filter.about.should == "super about"
      @article_type_filter.created_at_since.to_s.should == "2010-08-23 12:51:00 +0400"
      @article_type_filter.created_at_till.to_s.should == "2011-08-23 12:51:00 +0400"
    end
  end
end
