# == Schema Information
#
# Table name: participants
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  event_id   :integer          not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_participants_on_event_id  (event_id)
#  index_participants_on_user_id   (user_id)
#
# Foreign Keys
#
#  event_id  (event_id => events.id)
#  user_id   (user_id => users.id)
#
class Participant < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :user_id, uniqueness: { scope: :event_id }
end
