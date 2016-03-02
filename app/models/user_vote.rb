class UserVote < ActiveRecord::Base
    belongs_to :voting_user, class_name: "User"
    belongs_to :voted_photo, class_name: "Photo"
end


# The model with the foreign key (the id of another model) will belong to that other model