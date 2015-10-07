class Card

  attr_reader :on_journey

  def initialize
    @on_journey = false
  end

  def touch_in(station)
    @on_journey = true
  end
  
end
