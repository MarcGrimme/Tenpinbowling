require 'rspec'
require 'ten_pin_bowling'

describe 'Create Frames from balls' do

  it 'should Convert an array of ball scores to Frames' do
    game=TenPinBowling::Frames::from_balls "10", "0", "10", "0", "10", "0", "10","0", "10", "0", "10",
                                           "0", "10", "0", "x","a", "X", "0", "10", "10", "10"
    game.should == TenPinBowling::Frames.new([10, 0], [10, 0], [10,0], [10,0], [10,0], [10, 0], [10, 0], [10,0], [10,0], [10,10,10])
  end
end