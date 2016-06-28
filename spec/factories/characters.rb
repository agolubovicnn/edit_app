FactoryGirl.define do
 factory :character do
   image Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/characters/character.jpg')))
   char_name "Tester"
 end
end