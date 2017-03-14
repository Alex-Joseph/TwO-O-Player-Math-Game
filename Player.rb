class Player
attr_accessor :lives, :score, :name
  def initialize(num)
    @name = "Player " + num.to_s
    @lives = 3
    @score = 0
  end

  def lose_life
    @lives -= 1
  end
end
