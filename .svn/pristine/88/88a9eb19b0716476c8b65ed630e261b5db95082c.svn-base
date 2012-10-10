require 'spec_helper'

describe CommentFilter do
  context "creations" do
    it "should be created from hash" do
      @comment_filter = CommentFilter.new(
        :titlel => "here is title",
        :product_id => products(:products_supplements_carbokick).id,
        :comment_status_id => comment_statuses(:active_comment_status).id,
        :user_id => users(:quentin).id,
        :created_at_since => "2010-08-23 12:51", :created_at_till => "2011-08-23 12:51")
      @comment_filter.titlel.should == "here is title"
      @comment_filter.product_id.should == products(:products_supplements_carbokick).id
      @comment_filter.comment_status_id.should == comment_statuses(:active_comment_status).id
      @comment_filter.user_id.should == users(:quentin).id
      @comment_filter.created_at_since.to_s.should == "2010-08-23 12:51:00 +0400"
      @comment_filter.created_at_till.to_s.should == "2011-08-23 12:51:00 +0400"
    end
  end

  context "validations" do
    it { should belong_to(:product) }
    it { should belong_to(:comment_type) }
    it { should belong_to(:comment_status) }
    it { should belong_to(:user) }
  end
end
