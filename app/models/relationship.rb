class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "EndUser"
  belongs_to :followed, class_name: "EndUser"
end
