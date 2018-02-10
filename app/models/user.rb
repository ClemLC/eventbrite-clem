class User < ApplicationRecord
  validates :name, presence: true ,
                   uniqueness: { case_sensitive: false }

  has_and_belongs_to_many :attendedevents,
                          class_name: "Event",
                          foreign_key: "attendees_id",
                          join_table: "attendees_attended_events",
                          association_foreign_key: "attended_event_id"

  has_many :created_events, class_name: "Event", foreign_key: 'creator_id'
end
