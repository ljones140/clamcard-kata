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
    add_to_charge(calculate_charge)
  end

  private

  def calculate_charge
    fare = 250
    fare = 300 if [start_zone, end_zone].any?{ |zone| zone === :b }
    fare
  end

  def add_to_charge(fare)
    @charge += fare
  end

end
