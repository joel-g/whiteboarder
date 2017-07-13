class Challenge < ActiveRecord::Base
  valdiates :question, presence: true
  belongs_to :user_id
end
