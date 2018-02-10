class Event < ApplicationRecord
  validates :description, presence: true ,
                          uniqueness: true

  validates :date, presence: true

  validates :place, presence: true ,
                          uniqueness: true


  has_and_belongs_to_many :attendees,
                          class_name: "User",
                          foreign_key: "attended_event_id",
                          join_table: "attendees_attended_events",
                          association_foreign_key: "attendees_id"

  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
end
