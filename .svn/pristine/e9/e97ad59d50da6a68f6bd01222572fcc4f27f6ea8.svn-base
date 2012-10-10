require 'spec_helper'

describe CallmebackFilter do
  context "creations" do
    it "should be created from hash" do
      @callmeback_filter = CallmebackFilter.new(
        :user_id => users(:quentin).id,
        :contact_type_id => contact_types(:order_contact_type).id,
        :contact_status_id => contact_statuses(:active_contact_status).id,
        :phone => "+78121234567",
        :title => "callmeback title",
        :created_at_since => "2010-08-23 12:51", :created_at_till => "2011-08-23 12:51")
      @callmeback_filter.user_id.should == users(:quentin).id
      @callmeback_filter.contact_type_id.should == contact_types(:order_contact_type).id
      @callmeback_filter.contact_status_id.should == contact_statuses(:active_contact_status).id
      @callmeback_filter.title.should == "callmeback title"
      @callmeback_filter.phone.should == "+78121234567"
      @callmeback_filter.created_at_since.to_s.should == "2010-08-23 12:51:00 +0400"
      @callmeback_filter.created_at_till.to_s.should == "2011-08-23 12:51:00 +0400"
    end
  end

  context "validations" do
    it { should belong_to(:user) }
    it { should belong_to(:contact_type) }
    it { should belong_to(:contact_status) }
  end
end
