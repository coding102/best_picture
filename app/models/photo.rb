class Photo < ActiveRecord::Base
    belongs_to :user

    has_many :voting_users, through: :user_votes
    has_many :user_votes

    mount_uploader :avatar, AvatarUploader

end
