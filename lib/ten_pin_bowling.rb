module TenPinBowling
  class Frame < Array
    def initialize(first, second=0, third=0)
      super 3
      self[0]=if first == "X" or first=="x" then 10 else first.to_i end
      self[1]=second.to_i
      self[2]=third.to_i
      self.map!{ | ball | if ball > 10 then 10 else ball end}
    end
    def second
      self[1]
    end
    def third
      self[2]
    end
    def balls
      self.select{ | ball| ball >0 }.length
    end
    def score add_balls=length
      self[0,add_balls].inject(:+)
    end
    def strike
      first == 10
    end
    def spare
      not strike and self.score==10
    end
  end

  class Frames < Array
    def self.from_balls(*balls)
      frames=(0..9).map do | index |
        if balls[index*2] and index < 9 then
          balls[index*2,2]
        elsif balls[index*2] then
          balls[index*2,3]
        else
         [0,0]
        end
      end
      TenPinBowling::Frames.new(*frames)
    end
    def initialize(*frames)
      super 10, TenPinBowling::Frame.new(0,0)
      self.each_index do | index |
        if frames[index].is_a? TenPinBowling::Frame then
          self[index]=frames[index]
        elsif frames[index].is_a? Array then
          self[index]=TenPinBowling::Frame.new(frames[index][0], frames[index][1],
                                               if frames[index][2] then frames[index][2] else 0 end)
        elsif frames[index]==nil
          self[index]=TenPinBowling::Frame.new(0,0)
        else
          raise "Input error. Wrong format. Expecting array of two dimensional array, or array of frames #{frames}."
        end
      end
    end

    def frames
      self
    end

    def score index
      add_balls=if frames[index-1].strike then 2 elsif frames[index-1].spare then 1 end
      frames[index-1].score +
          if frames[index-1].strike or frames[index-1].spare and frames[index] then frames[index].score add_balls else 0 end +
          if frames[index-1].strike and frames[index] and frames[index].strike and frames[index+1] then
            frames[index+1].score add_balls-self[index].balls else 0 end
    end

    def score_accumulated index
      score=0
      (1..index).each do |i|
        score+=frames.score i
      end
      score
    end
  end
end
