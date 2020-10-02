class HealthCourse < ApplicationRecord
  validates :title, presence: true
  validates :contents, presence: true
  validates :location, presence: true
  validates :date, presence: true
  validates :site, presence: true
end
