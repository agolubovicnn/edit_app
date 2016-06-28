require 'carrierwave/test/matchers'

describe ImageUploader do
  include CarrierWave::Test::Matchers

  let(:character) { FactoryGirl.create :character }
  before do
    ImageUploader.enable_processing = true
    #@character = FactoryGirl.create(:character)
    @uploader = ImageUploader.new(character, :image)
    @uploader.store!(File.open("spec/fixtures/characters/character.jpg"))
  end

  after do
    ImageUploader.enable_processing = false
    @uploader.remove!
  end

  context 'the thumb version' do
    it "should scale down a landscape image to to fit within 50 by 50 pixels" do
      expect(@uploader.thumb).to be_no_larger_than(50, 50)
    end
  end

  context 'the thumb_lg version' do
    it "should scale down a landscape image to fit within 200 by 200 pixels" do
      expect(@uploader.thumb_lg).to be_no_larger_than(200, 200)
    end
  end

  it "should make the image readable only to the owner and not executable" do
    expect(@uploader).to have_permissions(0644)
  end
end