require 'card'

describe Card do

  let(:station){ double(:station, zone: :a) }
  let(:out_station){ double(:out_station, zone: :a) }

  it 'starts not on journey' do
    expect(subject.on_journey).to be false
  end

  it 'can touch in' do
    subject.touch_in(station)
    expect(subject.on_journey).to be true
  end

  it 'knows touched in station zone' do
    subject.touch_in(station)
    expect(subject.start_zone).to eq(:a)
  end

  it 'has no start zone when not on journey' do
    expect(subject.start_zone).to be nil
  end

  it 'can touch out' do
    subject.touch_out(out_station)
    expect(subject.on_journey).to be false
  end

  it 'knows touched out station zone' do
    subject.touch_out(out_station)
    expect(subject.end_zone).to eq(:a)
  end

  it 'can calculate the fare' do
    subject.touch_out(out_station)
    expect(subject.charge).to eq(2.50)
  end
end
