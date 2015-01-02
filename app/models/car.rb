class Car < ActiveRecord::Base
  belongs_to :manufacturer

  validates_presence_of :color
  validates_presence_of :year
  validates_inclusion_of :year, :in => 1920..Time.now.year
  validates_presence_of :mileage
  validates_numericality_of :mileage
  validates_presence_of :manufacturer

  def self.years
    year = Time.now.year
    1920..year
  end
end
