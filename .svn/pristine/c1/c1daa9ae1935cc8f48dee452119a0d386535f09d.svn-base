require 'spec_helper'

describe BookcaseFilter do
  context "creations" do
    it "should be created from hash" do
      @bookcase_filter = BookcaseFilter.new(
        :article_id => articles(:supplement_article).id,
        :product_id => products(:products_supplements_carbokick).id,
        :annotation => "super annotation",
        :created_at_since => "2010-08-23 12:51", :created_at_till => "2011-08-23 12:51")
      @bookcase_filter.article_id.should == articles(:supplement_article).id
      @bookcase_filter.product_id .should == products(:products_supplements_carbokick).id
      @bookcase_filter.annotation.should == "super annotation"
      @bookcase_filter.created_at_since.to_s.should == "2010-08-23 12:51:00 +0400"
      @bookcase_filter.created_at_till.to_s.should == "2011-08-23 12:51:00 +0400"
    end
  end

  context "validations" do
    it { should belong_to(:article) }
    it { should belong_to(:product) }
  end
end
