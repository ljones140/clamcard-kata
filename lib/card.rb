class Card

  attr_reader :on_journey, :start_zone

  def initialize
    @on_journey = false
  end

  def touch_in(station)
    @on_journey = true
    @start_zone = station.zone
  end

end
