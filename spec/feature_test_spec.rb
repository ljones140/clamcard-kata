require 'card'
require 'station'

describe "zone a journey " do

  card = Card.new
  start_station = Station.new(:a)
  end_station = Station.new(:a)

  it 'calculates charge to be 250' do
    card.touch_in(start_station)
    card.touch_out(end_station)
    expect(card.charge).to eq(250)
  end

end
