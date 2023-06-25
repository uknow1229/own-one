class Weight < ApplicationRecord
  belongs_to :end_user

  validates :value, :start_time,  presence: true
end
