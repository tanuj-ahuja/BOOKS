class Micropost < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
   mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, length: { maximum: 140 }
  validate :picture_size
  validates :title, presence: true,length: {maximum: 40}
  validates :author, presence: true,length: {maximum: 30}
  validates :yop, presence: true,length: {is: 4},numericality:{only_integer: true}
  validates :price, presence: true,numericality:{only_integer: true}



  private

   def picture_size
   	if picture.size >  5.megabytes
   		errors.add(:picture,"should be less than 5MB")
   	end
   end	

   def self.search(search)
  where("title LIKE ? OR author LIKE ?", "%#{search}%","%#{search}%") 
end


end
