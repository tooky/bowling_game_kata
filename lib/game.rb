class Game
  attr_reader :score

  def self.score(rolls)
    new(rolls).score
  end

  def initialize(rolls, max_frames = 10)
    @max_frames, @frames = max_frames, []
    @score = build_score(0, rolls)
  end


  private
  attr_reader :rolls, :max_frames

  def build_score(score, rolls)
    return score if finished?
    add_frame(rolls)
    build_score(score + last_frame.score, remaining(rolls))
  end

  def finished?
    max_frames == frame_count
  end

  def add_frame(rolls)
    @frames << Frame.new(rolls)
  end

  def frame_count
    @frames.length
  end

  def remaining(rolls)
    rolls[last_frame.shift..-1]
  end

  def last_frame
    @frames.last
  end

  class Frame
    attr_reader :roll1, :roll2, :roll3

    def initialize(rolls)
      @roll1, @roll2, @roll3 = rolls[0..2]
    end

    def strike?
      roll1 == 10
    end

    def spare?
      roll1 + roll2 == 10
    end

    def shift
      return 1 if strike?
      2
    end

    def score
      return 10 + roll2 + roll3 if strike?
      return 10 + roll3 if spare?
      roll1 + roll2
    end

  end
end
