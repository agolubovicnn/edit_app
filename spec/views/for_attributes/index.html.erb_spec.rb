require 'rails_helper'

RSpec.describe "for_attributes/index", :type => :view do
  before(:each) do
    assign(:for_attributes, [
      ForAttribute.create!(
        :name => "Name",
        :value => 1,
        :image => "Image",
        :character => nil
      ),
      ForAttribute.create!(
        :name => "Name",
        :value => 1,
        :image => "Image",
        :character => nil
      )
    ])
  end

  it "renders a list of for_attributes" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
