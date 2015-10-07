require 'station'


describe Station do

  subject(:station){ Station.new(:a) }

  it 'is initialized with a zone' do
    expect(station.zone).to eq(:a)

  end

end
