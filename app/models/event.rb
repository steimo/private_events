class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :invitations, dependent: :destroy
  has_many :attendees, through: :invitations
  has_one_attached :image

  validates :title, presence: true, length: { maximum: 70 }
  validates :description, presence: true, length: { maximum: 140 }
  validates :location, :start_time, :end_time, presence: true
end
