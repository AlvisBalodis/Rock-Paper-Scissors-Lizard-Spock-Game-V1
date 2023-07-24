module GameMessages
  def greeting_msg
    puts msg = <<-TEXT
      --------------------------------
      ********************************
               Welcome to the
      Rock Paper Scissors Lizard Spock
                    Game
      ********************************
      --------------------------------
  
      Here are The Rules of The Game:
         • Rock crushes Scissors
         • Scissors cuts Paper
         • Paper covers Rock
         • Rock crushes Lizard
         • Lizard poisons Spock
         • Spock smashes Scissors
         • Scissors decapitates Lizard
         • Lizard eats Paper
         • Paper disproves Spock
         • Spock vaporizes Rock
  
      The winner will be chosen after 3 rounds.
      TEXT
  end

  def display_choices(player, computer)
    puts msg = <<-TEXT
               You:        #{player.upcase}
               Computer:   #{computer.upcase}
      TEXT
  end

  def wrong_choice_msg
    puts msg = <<-TEXT
      Sorry! That's not a valid choice.
      Please make a vaild choice (rock paper scissors lizard spock):
      TEXT
  end

  def clear_screen
    system("clear") || system("cls")
  end

  def make_move_msg
    puts msg = <<-TEXT
      Please make a choice (rock paper scissors lizard spock):
      TEXT
  end
  def round_msg(round)
    puts "\n"
    puts "Game Round: #{round}"
  end

  def round_win_msg(player, computer)
    if player_win_round?(player, computer)
      puts "\n"
      puts msg = <<-TEXT
               *------------------*
              *-       YOU        -*
              *-  won this round! -*
               *------------------*
        TEXT
      puts "\n"
    else
      puts "\n"
      puts msg = <<-TEXT
               *------------------*
              *-     COMPUTER     -*
              *-  won this round! -*
               *------------------*
        TEXT
      puts "\n"
    end
  end

  def round_tie_msg
    puts "\n"
    puts msg = <<-TEXT
               *------------------*
              *-  Round is a Tie. -*
              *- Let's try again. -*
               *------------------*
      TEXT
  end

  def score_display_msg(player, computer)
    puts "\n"
    puts "Your Score:     #{player}"
    puts "Computer Score: #{computer}"
  end

  def game_win_msg(player, computer)
    if player > computer
      puts "\n"
      puts msg = <<-TEXT
             * * * * * * * * * * * * *
             *   YOU WON THIS GAME!  *
             * * * * * * * * * * * * *
      TEXT
    else
      puts "\n"
      puts msg = <<-TEXT
             * * * * * * * * * * * * *
             *COMPUTER WON THIS GAME!*
             * * * * * * * * * * * * *
      TEXT
    end
  end

  def goodbye_msg
    puts "\n"
    puts "Thanks for played Rock Paper Scissors Lizard Spock! Goodbye!"
  end
end
