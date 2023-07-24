require_relative "PlayerClass"
require_relative "ComputerClass"
require_relative "GameMessagesModule"

class Game
  attr_reader :player, :computer
  include GameMessages

  def initialize
    player = Player.new
    @player = player
    computer = Computer.new(%i[rock paper scissors lizard spock])
    @computer = computer
  end

  def player_win_round?(player, computer)
    WIN_RULES[player].include?(computer)
  end

  def player_round_is_tie?(player, computer)
    player == computer
  end

  def player_win_game?(player, computer)
    player > computer
  end

  def game_is_over?(round)
    round > 3
  end

  WIN_RULES = {
    rock: %i[scissors lizard],
    paper: %i[rock spock],
    scissors: %i[paper lizard],
    lizard: %i[spock paper],
    spock: %i[scissors rock]
  }

  def play_game
    game = Game.new
    player_score = 0
    computer_score = 0
    round = 1
    clear_screen
    game.greeting_msg
    loop do
      loop do
        game.round_msg(round)
        game.make_move_msg
        player_choice = player.move
        loop do
          break if player.valid_choice?(player_choice)
          game.wrong_choice_msg
          player_choice = player.move
        end
        puts computer_choice = computer.move
        game.clear_screen
        game.display_choices(player_choice, computer_choice)

        if player_round_is_tie?(player_choice, computer_choice)
          game.round_tie_msg
          game.score_display_msg(player_score, computer_score)
        elsif player_win_round?(player_choice, computer_choice)
          game.round_win_msg(player_choice, computer_choice)
          player_score += 1
          round += 1
          game.score_display_msg(player_score, computer_score)
        else
          computer_score += 1
          round += 1
          game.round_win_msg(player_choice, computer_choice)
          game.score_display_msg(player_score, computer_score)
        end
        break if game_is_over?(round)
      end
      if player_win_game?(player_score, computer_score)
        game.game_win_msg(player_score, computer_score)
        break
      else
        game.game_win_msg(player_score, computer_score)
        break
      end
    end
    game.goodbye_msg
    exit
  end
end

competition = Game.new
competition.play_game
