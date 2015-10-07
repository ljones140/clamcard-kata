require 'card'
require 'station'

describe "zone a journey " do

  card = Card.new
  start_station = Station.new(:a)
  end_station = Station.new(:a)

  it 'calculates charge to be £2.50' do
    card.touch_in(start_station)
    card.touch_out(end_station)
    expect(card.charge).to eq(2.50)
  end

end
