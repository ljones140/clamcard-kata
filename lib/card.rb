class Card

  attr_reader :on_journey

  def touch_in(station)
    @on_journey = true
  end

end