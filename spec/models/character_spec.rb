require 'rails_helper'

RSpec.describe Character, :type => :model do

    it "is valid with a user_name and image" do
      char = FactoryGirl.create(:character)
      expect(char).to be_valid
    end

end
