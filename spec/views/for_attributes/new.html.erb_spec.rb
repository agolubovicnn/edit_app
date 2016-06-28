require 'rails_helper'

RSpec.describe "for_attributes/new", :type => :view do
  before(:each) do
    assign(:for_attribute, ForAttribute.new(
      :name => "MyString",
      :value => 1,
      :image => "MyString",
      :character => nil
    ))
  end

  it "renders new for_attribute form" do
    render

    assert_select "form[action=?][method=?]", for_attributes_path, "post" do

      assert_select "input#for_attribute_name[name=?]", "for_attribute[name]"

      assert_select "input#for_attribute_value[name=?]", "for_attribute[value]"

      assert_select "input#for_attribute_image[name=?]", "for_attribute[image]"

      assert_select "input#for_attribute_character_id[name=?]", "for_attribute[character_id]"
    end
  end
end
