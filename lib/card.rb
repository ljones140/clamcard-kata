class Card

  attr_reader :on_journey, :start_zone, :end_zone, :charge

  def initialize
    @on_journey = false
    @charge = 0
  end

  def touch_in(station)
    @on_journey = true
    @start_zone = station.zone
  end

  def touch_out(station)
    @on_journey = false
    @end_zone = station.zone
    calculate_charge
  end

  def calculate_charge
    @charge = 2.50
  end
end
