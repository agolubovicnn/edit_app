require 'rails_helper'

RSpec.describe "characters/index", :type => :view do
  before(:each) do
    assign(:characters, [
      Character.create!(
        :char_name => "Char Name",
        :image => "Image",
        :user => nil
      ),
      Character.create!(
        :char_name => "Char Name",
        :image => "Image",
        :user => nil
      )
    ])
  end

  it "renders a list of characters" do
    render
    assert_select "tr>td", :text => "Char Name".to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
