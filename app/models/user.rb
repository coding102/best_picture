class User < ActiveRecord::Base
    has_many :photos
    has_secure_password 
    validates_confirmation_of :password
    validates_presence_of :password, on: :create

    # scope :photo_today, lambda{ where(:created_at => (Time.now.beginning_of_day..Time.now.end_of_day)) }
    # scope :photo_today, -> { where("createdAt BETWEEN ? AND ?", Time.now - (60 * 60 * 24), Time.now) }

    def uploaded_today?
        if !self.photos.empty?
           self.photos.last.created_at.to_i.between?(Time.now.to_i - (60 * 60 * 24), Time.now.to_i)
       else
        false
    end
    
end

end

