class User < ActiveRecord::Base
    has_many :photos
    has_secure_password 
    validates_confirmation_of :password
    validates_presence_of :password, on: :create

    # scope :photo_today, lambda{ where(:created_at => (Time.now.beginning_of_day..Time.now.end_of_day)) }
    # scope :photo_today, -> { where("createdAt BETWEEN ? AND ?", Time.now - (60 * 60 * 24), Time.now) }

end

