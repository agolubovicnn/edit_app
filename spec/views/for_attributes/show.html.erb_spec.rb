require 'rails_helper'

RSpec.describe "for_attributes/show", :type => :view do
  before(:each) do
    @for_attribute = assign(:for_attribute, ForAttribute.create!(
      :name => "Name",
      :value => 1,
      :image => "Image",
      :character => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Image/)
    expect(rendered).to match(//)
  end
end
