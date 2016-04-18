require 'spec_helper'

describe Lita::Handlers::OnewheelOpenweathermap, lita_handler: true do
  it { is_expected.to route_command('uv') }

  before do
    mock = File.open('spec/fixtures/Portland.json').read
    allow(RestClient).to receive(:get) { mock }
  end

  it 'gives a uv index number' do
    send_command 'uv'
    expect(replies.last).to eq('UV index in Portland, OR is 5.41 today.')
  end
end
