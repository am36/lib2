class Book < ActiveRecord::Base
    
 def self.search(search)
  where("name LIKE ?", "%#{search}%") 
  where("author LIKE ?", "%#{search}%")
 end

end
