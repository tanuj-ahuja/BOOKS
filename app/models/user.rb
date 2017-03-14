class User < ApplicationRecord
    has_many :microposts,dependent: :destroy
   before_save { self.email = email.downcase }
   validates :name,  presence: true, length: { maximum: 50 }
   validates :college,  presence: true, length: { maximum: 50 }
   validates :sem,  presence: true, length: { maximum: 1 }, inclusion: {in: 1..8},numericality:{only_integer: true}
   validates :phone,  presence: true, length: {is: 10 },numericality:{only_integer: true}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

         has_secure_password
         validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
          has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "seller_id",
                                  dependent:   :destroy
       has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "buyer_id",
                                  dependent:   :destroy        
       has_many :buyers, through: :active_relationships                        
       has_many :sellers,through: :active_relationships                             
   def feed
      seller_ids="SELECT seller_id FROM relationships
                  WHERE buyer_id = :user_id"
      Micropost.where("user_id IN (#{seller_ids})
        ",user_id: id)
   end 

   def weed
    buyer_ids= "SELECT buyer_id FROM relationships
                WHERE seller_id = :id"
    User.where("id IN (#{buyer_ids})",id: id)
   end
   def r
    message_ids="SELECT message_id FROM relationships
                 WHERE seller_id = :id"
    Micropost.where("id IN (#{message_ids})",id: id)             
   end 

   def hey
    Relationship.where("seller_id=?",id)
   end 

   def my(other_micropost)
     Relationship.where("buyer_id=? AND message_id=?",id,other_micropost.id) 
   end
 

   def weedy
    seller_ids= "SELECT seller_id FROM relationships
                WHERE buyer_id = :id"
    User.where("id IN (#{seller_ids})",id: id)
   end
  
   def ry
    message_ids="SELECT message_id FROM relationships
                 WHERE buyer_id = :id"
    Micropost.where("id IN (#{message_ids})",id: id)             
   end 

   def heyy
     Relationship.where("buyer_id=?",id)
   end 

 #  def add(other_user)
  #   sellers << other_user
  #end                  
end
