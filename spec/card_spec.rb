require 'card'

describe Card do

  let(:station){ double(:station, zone: :a) }
  let(:out_station){ double(:out_station, zone: :a) }
  let(:b_station){ double(:b_station, zone: :b) }

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

  it 'can calculate the fare for zone A' do
    subject.touch_out(out_station)
    expect(subject.charge).to eq(250)
  end

  it 'can calculate the fare for journeys which include zone B' do
    subject.touch_in(station)
    subject.touch_out(b_station)
    expect(subject.charge).to eq(300)
  end

  it 'can calculate the fare for more than one journey' do
    2.times do
      subject.touch_in(station)
      subject.touch_out(b_station)
    end
    expect(subject.charge).to eq(600)
  end
end
