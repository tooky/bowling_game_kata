require 'frame'

class Game
  def self.score(rolls)
    game = new
    rolls.each { |roll| game.roll(roll) }
    game.score
  end

  def initialize
    @frames = []
  end

  def roll(pins)
    add_frame if needs_new_frame?
    current_frame.roll(pins)
    add_bonus_rolls(pins)
  end

  def score
    @frames.inject(0) { |score, frame| score += frame.score }
  end

  private
  def add_frame
    @frames << Frame.new
  end

  def add_bonus_rolls(pins)
    last_frame.roll(pins) if last_frame_requires_bonus?
    before_last_frame.roll(pins) if before_last_frame_requires_bonus?
  end

  def current_frame
    @frames.last
  end

  def last_frame
    @frames[-2]
  end

  def last_frame_requires_bonus?
    last_frame && last_frame.requires_bonus?
  end

  def before_last_frame
    @frames[-3]
  end

  def before_last_frame_requires_bonus?
    before_last_frame && before_last_frame.requires_bonus?
  end

  def needs_new_frame?
    return false if all_frames_started?
    current_frame.nil? || current_frame.finished?
  end

  def all_frames_started?
    @frames.count == 10
  end
end
