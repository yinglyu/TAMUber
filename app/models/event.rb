class Event < ApplicationRecord
  enum frequency: { once: 0, weekly: 1, biweekly: 2, monthly: 3}
  belongs_to :driver, :class_name => "Driver", :foreign_key => "driver_id"
  validates :driver, presence: true
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
  def duration
    (self.end.to_time - self.start.to_time).to_i
  end
  def schedule
    @schedule ||= begin
      schedule = IceCube::Schedule.new(now = start)
      case frequency
      when 'weekly'
        schedule.add_recurrence_rule IceCube::Rule.weekly(1)
      when 'biweekly'
        schedule.add_recurrence_rule IceCube::Rule.weekly(2)
      when 'monthly'
        schedule.add_recurrence_rule IceCube::Rule.monthly(1)
      end
      schedule
    end
  end
  def recur(start_date, end_date)
    start_frequency = start_date ? start_date.to_date : Date.today - 1.year
    end_frequency = end_date ? end_date.to_date : Date.today + 1.year
    schedule.occurrences_between(start_frequency, end_frequency)
  end
end
