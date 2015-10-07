class Card

  attr_reader :on_journey, :start_zone, :end_zone, :charge

  def initialize
    @on_journey = false
    @charge = 0
    @cap = 700
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
    if zone_b_entered?
      fare = 300
      increase_cap
    end
    fare
  end

  def zone_b_entered?
    [start_zone, end_zone].any?{ |zone| zone === :b }
  end

  def increase_cap
    @cap = 800
  end

  def add_to_charge(fare)
    @charge += fare
    @charge = @cap if @charge > @cap
  end

end
