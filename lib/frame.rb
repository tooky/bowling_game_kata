class Frame
  def initialize
    @rolls = []
  end

  def finished?
    strike? || rolls_completed?
  end

  def roll(pins)
    @rolls << pins
  end

  def score
    @rolls.inject(0) { |score, roll| score += roll }
  end

  def strike?
    @rolls.first == 10
  end

  def spare?
    rolls_completed? && basic_score == 10
  end

  def requires_bonus?
    (strike? || spare?) && !bonus_rolls_completed?
  end

  private
  def rolls_completed?
    @rolls.size > 1
  end

  def bonus_rolls_completed?
    @rolls.size == 3
  end

  def basic_score
    @rolls[0] + @rolls[1]
  end
end
