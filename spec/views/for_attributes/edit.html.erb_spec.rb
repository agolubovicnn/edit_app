require 'rails_helper'

RSpec.describe "for_attributes/edit", :type => :view do
  before(:each) do
    @for_attribute = assign(:for_attribute, ForAttribute.create!(
      :name => "MyString",
      :value => 1,
      :image => "MyString",
      :character => nil
    ))
  end

  it "renders the edit for_attribute form" do
    render

    assert_select "form[action=?][method=?]", for_attribute_path(@for_attribute), "post" do

      assert_select "input#for_attribute_name[name=?]", "for_attribute[name]"

      assert_select "input#for_attribute_value[name=?]", "for_attribute[value]"

      assert_select "input#for_attribute_image[name=?]", "for_attribute[image]"

      assert_select "input#for_attribute_character_id[name=?]", "for_attribute[character_id]"
    end
  end
end
