class Event < ApplicationRecord
  belongs_to :driver
  validates :title, presence: true
  validates :start, presence: true
  validates :end, presence: true
  validate :on_the_same_date
  def on_the_same_date
    errors.add(:end, "must at the same date as start date") unless
        self.start.midnight == self.end.midnight
  end
  attr_accessor :date_range
  def all_day_event?
    self.start == self.start.midnight && self.end == self.end.midnight ? true : false
  end
end
