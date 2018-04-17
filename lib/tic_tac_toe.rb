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
  
  def initialize(board = Array.new(9, " "))
    @board = board
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

  def position_taken?(location)
    if @board[location] != " " && @board[location] != ""
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(@board, index)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      current_player = current_player
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count(board)
    count = 0
    board.each do |turn|
      if turn == "X" || turn == "O"
        count += 1
      end
    end
    return count
  end

  def current_player(board)
    if turn_count(board).odd?
      return "O"
    else
      return "X"
    end
  end

  def won?(board)
    WIN_COMBINATIONS.any? do |win_combo|
      index_1 = win_combo[0]
      index_2 = win_combo[1]
      index_3 = win_combo[2]
      position_1 = board[index_1]
      position_2 = board[index_2]
      position_3 = board[index_3]
      if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combo
      else
        false
      end
    end
  end

  def full?(board)
    board.none?{|element| element == " " || element.nil?}
  end

  def draw?(board)
    if !won?(board) && full?(board)
      true
    end
  end

  def over?(board)
    if draw?(board) || won?(board)
      true
    end
  end

  def winner(board)
    if won?(board)
      winner = won?(board)
      return board[winner[0]]
    end
  end

  def play(board)
    until over?(board)
      turn(board)
    end
    if won?(board)
      puts "Congratulations #{winner(board)}!"
    elsif draw?(board)
      puts "Cat's Game!"
    end
  end
  
end