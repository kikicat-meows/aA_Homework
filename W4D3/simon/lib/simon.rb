require "colorize"

class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @seq = []
    @sequence_length = 1
    @game_over = false
  end

  def add_random_color
    @seq << COLORS.shuffle.sample

  end

  def play
    system("cls")
    until @game_over
      take_turn
      system("cls")
    end

      game_over_message
      reset_game
  end

  def take_turn
    show_sequence
    require_sequence

    unless @game_over
      round_success_message
      @sequence_length += 1
    end
  end
  
  def show_sequence
    add_random_color
    print "The current sequence is:"
    @seq.each do |color|
      print " #{color}".colorize(:color => color.to_sym)
    end
    sleep(3)
    system("cls")
  end
  
  def require_sequence
    puts "Please input the color sequence (with spaces in between): "
    input = gets.chomp.split(" ")

    @game_over = true if input.length != @seq.length

    input.each_with_index do |color, idx|
      @game_over = true if @seq[idx] != color.downcase
    end
  end

  def round_success_message
    puts "You have entered the correct sequence."
  end

  def game_over_message
    puts "Sorry, that is incorrect."
    puts "Game over. Your longest correct sequence was #{@sequence_length - 1}."
  end
  
  def replay
    puts "Would you like to play again? Y/N"
    answer = gets.chomp

    answer.upcase == "Y" ? true : false
  end

  def reset_game
    @seq = []
    @sequence_length = 1
    @game_over = false

    if replay
      system("cls")
      play
    else
      puts "Thank you for playing Simon Says."
      sleep(2.5)
      system("cls")
      return
    end
  end

end


if __FILE__ == $PROGRAM_NAME
  game = Simon.new
  game.play
end
