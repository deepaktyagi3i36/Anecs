require 'spec_helper'

describe ComplaintFilter do
  context "creations" do
    it "should be created from hash" do
      @complaint_filter = ComplaintFilter.new(
        :user_id => users(:quentin).id,
        :complaint_type_id => complaint_types(:order_complaint_type).id,
        :complaint_status_id => complaint_statuses(:active_complaint_status).id,
        :title => "complaint title",
        :created_at_since => "2010-08-23 12:51", :created_at_till => "2011-08-23 12:51")
      @complaint_filter.user_id.should == users(:quentin).id
      @complaint_filter.complaint_type_id.should == complaint_types(:order_complaint_type).id
      @complaint_filter.complaint_status_id.should == complaint_statuses(:active_complaint_status).id
      @complaint_filter.title.should == "complaint title"
      @complaint_filter.created_at_since.to_s.should == "2010-08-23 12:51:00 +0400"
      @complaint_filter.created_at_till.to_s.should == "2011-08-23 12:51:00 +0400"
    end
  end

  context "validations" do
    it { should belong_to(:user) }
    it { should belong_to(:complaint_type) }
    it { should belong_to(:complaint_status) }
  end

end
