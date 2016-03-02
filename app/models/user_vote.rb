class UserVote < ActiveRecord::Base
    belongs_to :voting_user, class_name: "User", foreign_key: :user_id
    belongs_to :voted_photo, class_name: "Photo", foreign_key: :photo_id
end


# The model with the foreign key (the id of another model) will belong to that other model