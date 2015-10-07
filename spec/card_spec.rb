require 'card'

describe Card do
  let(:station){ double(:station, zone: :a) }
  it 'can touch in' do
    subject.touch_in(station)
    expect(subject.on_journey).to be true
  end
end