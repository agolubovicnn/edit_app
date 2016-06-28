require 'rails_helper'

RSpec.describe "characters/new", :type => :view do
  before(:each) do
    assign(:character, Character.new(
      :char_name => "MyString",
      :image => "MyString",
      :user => nil
    ))
  end

  it "renders new character form" do
    render

    assert_select "form[action=?][method=?]", characters_path, "post" do

      assert_select "input#character_char_name[name=?]", "character[char_name]"

      assert_select "input#character_image[name=?]", "character[image]"

      assert_select "input#character_user_id[name=?]", "character[user_id]"
    end
  end
end
