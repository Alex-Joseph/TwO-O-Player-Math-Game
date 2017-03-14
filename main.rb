require './Player'
require './Question'

class Game
  attr_accessor :player_1, :player_2, :new_turn, :show_score, :end_game
  def initialize
    @player_1 = Player.new(1)
    @player_2 = Player.new(2)
  end

  def new_turn
    puts "----- NEW TURN -----"
  end

  def show_score(p1_lives, p2_lives)
    puts "P1: #{p1_lives}/3 vs P2: #{p2_lives}/3"
  end

  def end_game(current_player)
    puts "#{current_player.name} Loses!"
    puts "----- GAME OVER -----"
    puts "Good bye!"
  end
end

@round = 0

puts "Let the math battle begin!"

game = Game.new
p1 = game.player_1
p2 = game.player_2

while p1.lives > 0 && p2.lives > 0

  if @round % 2 == 0
    current_player = p1
  else
    current_player = p2
  end

  if @round > 0
    game.new_turn
  end

  q = Question.new
  puts "#{current_player.name} " + q.ask_question
  resp = gets.chomp
  if q.check_ans(resp.to_i)
    puts "Correct!"
    game.show_score(p1.lives, p2.lives)
    @round += 1
  else
    puts "Wrong!"
    current_player.lose_life
    if current_player.lives == 0
      game.end_game(current_player)
      break
    end
    game.show_score(p1.lives, p2.lives)
    @round += 1
  end
end
