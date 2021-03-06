class TicTacToe
  
  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
  ]
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
  def board=(board)
    @board = board
  end
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, current_player = "X")
    @board[index] = current_player
  end

  def position_taken? (location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move? (index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      c_player = current_player
      move(index, c_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    count = 0
    @board.each do |turn|
      if turn == "X" || turn == "O"
        count += 1
      end
    end
    return count
  end

  def current_player
    if turn_count.odd?
      return "O"
    else
      return "X"
    end
  end

  def won?
    WIN_COMBINATIONS.any? do |win_combo|
      index_1 = win_combo[0]
      index_2 = win_combo[1]
      index_3 = win_combo[2]
      position_1 = @board[index_1]
      position_2 = @board[index_2]
      position_3 = @board[index_3]
      if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combo
      else
        false
      end
    end
  end

  def full?
    @board.none?{|element| element == " " || element.nil?}
  end

  def draw?
    if !won? && full?
      true
    end
  end

  def over?
    if draw? || won?
      true
    end
  end

  def winner
    if won?
      winner = won?
      return @board[winner[0]]
    end
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
  
end