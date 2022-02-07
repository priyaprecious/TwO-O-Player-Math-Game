require './player'
require './question'

class Game

  attr_accessor :game_over , :player1 , :player2 , :current_player

  def initialize
    self.game_over = false
    self.player1 = Player.new('Player 1')
    self.player2 = Player.new('Player 2')
    self.current_player = self.player1
  end

  def change_current_player
     self.current_player = (self.current_player == self.player1) ? self.player2 : self.player1
  end

  def start
    while !self.game_over do
        question = Question.new
        puts self.current_player.name + question.generate_question
        print '>'
        answer = gets.chomp.to_i

        if (answer == (question.num1 + question.num2))
          puts 'YES! You are correct.'
        else
          self.current_player.update_lives
          puts 'Seriously? No!'
        end

        if self.current_player.lives == 0
          self.game_over = true
          break
        end
        puts "P1: #{self.player1.lives}/#{Player.total_lives} vs P2: #{self.player2.lives}/#{Player.total_lives}"
        change_current_player
        puts '-----NEW TURN-----'
    end
    end_game
  end

  def end_game
    puts (self.current_player == self.player1) ? "#{self.player2.name} wins with a score of #{self.player2.lives}/#{Player.total_lives}" : "#{self.player1.name} wins with a score of #{self.player1.lives}/#{Player.total_lives}"
    puts '-----GAME OVER-----'
    puts 'Good bye!'
  end
end