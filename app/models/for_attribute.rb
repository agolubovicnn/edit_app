class ForAttribute < ActiveRecord::Base
  belongs_to :character
  mount_uploader :image, ImageUploader
  validates :name, presence: true
  validates :image, presence: true
  validate :image_size

  private
    
      # Validates the size of an uploaded picture.
    def image_size
      if image.size > 5.megabytes
        errors.add(:image, "should be less than 5MB")
      end
    end
end
