require 'rails_helper'

RSpec.describe "characters/edit", :type => :view do
  before(:each) do
    @character = assign(:character, Character.create!(
      :char_name => "MyString",
      :image => "MyString",
      :user => nil
    ))
  end

  it "renders the edit character form" do
    render

    assert_select "form[action=?][method=?]", character_path(@character), "post" do

      assert_select "input#character_char_name[name=?]", "character[char_name]"

      assert_select "input#character_image[name=?]", "character[image]"

      assert_select "input#character_user_id[name=?]", "character[user_id]"
    end
  end
end
