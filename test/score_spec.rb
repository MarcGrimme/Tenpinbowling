require 'rspec'
require 'ten_pin_bowling'

describe 'Double' do
  it 'should evaluate a score of 29 for the 1st frame to this set of frames [10,0],[10,0],[3,6]... ' do
    game1=TenPinBowling::Frames.new([10, 0], [10, 0], [3, 6], [1, 3], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0])
    game1.score(1).should == 23 and game1.score_accumulated(1).should == 23
  end
end

describe 'Double2' do
  it 'should evaluate a score of 19 for the 2nd frame to this set of frames [10,0],[10,0],[3,6]... ' do
    game1=TenPinBowling::Frames.new([10, 0], [10, 0], [3, 6], [1, 3])
    game1.score(2).should == 19 and game1.score_accumulated(2).should == 23+19
  end
end

describe 'Double3' do
  it 'should evaluate a score of 19 for the 10nd frame to this set of frames [10,0],[10,0],[3,6]... ' do
    game1=TenPinBowling::Frames.new(TenPinBowling::Frame.new(10, 0), TenPinBowling::Frame.new(10, 0), TenPinBowling::Frame.new(3, 6), [0,0], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0])
    game1.score(2).should == 19 and game1.score_accumulated(10).should == 23+19+9
  end
end

describe 'Spare' do
  it 'should evaluate a score of 19 for the 2nd frame to this set of frames [9,1],[3,6]... ' do
    game1=TenPinBowling::Frames.new([10, 0], [9, 1], [3, 6], [1, 3])
    game1.score(2).should == 13 and game1.score_accumulated(2).should == 20+13
  end
end

describe 'Score1' do
  it 'should evaluate a score of 4 for the 4th frame to this set of frames [10,0],[3,6],[1,3]... ' do
    game1=TenPinBowling::Frames.new([10, 0], [10, 0], [3, 6], [1, 3])
    game1.score(4).should == 4 and game1.score_accumulated(4).should == 23+19+9+4
  end
end

describe 'Score2' do
  it 'should evaluate a score of 9 for the 3rd frame to this set of frames [10,0],[10,0],[3,6]... ' do
    game1=TenPinBowling::Frames.new([10, 0], [10, 0], [3, 6], [1, 3])
    game1.score(3).should == 9 and game1.score_accumulated(3).should == 23+19+9
  end
end

describe 'perfect game1' do
  it 'should evaluate a score of 30 for the 8th frame to this set of frames [10,0]x9,[10,10,10]' do
    game1=TenPinBowling::Frames.new([10, 0], [10, 0], [10,0], [10,0], [10,0], [10, 0], [10, 0], [10,0], [10,0], [10,10,10])
    game1.score(8).should == 30 and game1.score_accumulated(8).should == 240
  end
end

describe 'perfect game2' do
  it 'should evaluate a score of 30 for the 9th frame to this set of frames [10,0]x9,[10,10,10]' do
    game1=TenPinBowling::Frames.new([10, 0], [10, 0], [10,0], [10,0], [10,0], [10, 0], [10, 0], [10,0], [10,0], [10,10,10])
    game1.score(9).should == 30 and game1.score_accumulated(9).should == 270
  end
end

describe 'perfect game3' do
  it 'should evaluate a score of 30 for the 10th frame to this set of frames [10,0]x9,[10,10,10]' do
    game1=TenPinBowling::Frames.new([10, 0], [10, 0], [10,0], [10,0], [10,0], [10, 0], [10, 0], [10,0], [10,0], [10,10,10])
    game1.score(10).should == 30 and game1.score_accumulated(10).should == 300
  end
end

describe 'nearly perfect game1' do
  it 'should evaluate a score of 19 for the 10th frame to this set of frames [10,0]x9,[9,9,1]' do
    game1=TenPinBowling::Frames.new([10, 0], [10, 0], [10,0], [10,0], [10,0], [10, 0], [10, 0], [10,0], [10,0], [9,9,1])
    game1.score(10).should == 19 and game1.score_accumulated(10).should == 7*30+29+28+19
  end
end

describe 'typical game' do
  it 'should evaluate a score of 133 for the following game [1,4][4,5][6,4][5,5][10,0][0,1][7,3][6,4][10,0][2,8,6]' do
    game1=TenPinBowling::Frames.new([1,4],[4,5],[6,4],[5,5],[10,0],[0,1],[7,3],[6,4],[10,0],[2,8,6])
    game1.score(10).should == 16 and game1.score_accumulated(10).should == 133
  end
end