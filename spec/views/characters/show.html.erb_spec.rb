require 'rails_helper'

RSpec.describe "characters/show", :type => :view do
  before(:each) do
    @character = assign(:character, Character.create!(
      :char_name => "Char Name",
      :image => "Image",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Char Name/)
    expect(rendered).to match(/Image/)
    expect(rendered).to match(//)
  end
end
