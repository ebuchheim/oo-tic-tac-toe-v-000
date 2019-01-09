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

    def initialize
        board = Array.new(9, " ")
        @board = board
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(input)
        index = input.to_i - 1
    end

    def move(index, value = "X")
        @board[index] = value
    end

    def position_taken?(input)
        input_to_index(input)
        if @board[input] == "X" || @board[input] == "O"
            true
        else
            false
        end
    end

    def valid_move?(input)
        !position_taken?(input) && input.between?(0, 8)
    end

    def turn
        puts "Please enter 1-9:"
        user_input = gets.strip
        index = input_to_index(user_input)
        if valid_move?(index)
            move(index, current_player)
            display_board
        else
            turn
        end
    end

    def turn_count    
        @position_counter = 0
        @board.each do |space|
            if space == "X" || space == "O"
                @position_counter += 1
            end
        end
        @position_counter
    end

    def current_player
        turn_count
        if @position_counter % 2 == 0
            "X"
        else
            "O"
        end
    end

    def won?
        WIN_COMBINATIONS.each do |individual_combo|  
            win_index_1 = individual_combo[0]
            win_index_2 = individual_combo[1]
            win_index_3 = individual_combo[2]
      
            position_1 = @board[win_index_1]
            position_2 = @board[win_index_2]
            position_3 = @board[win_index_3]
      
            if position_1 == "X" && position_2 == "X" && position_3 == "X"
              return individual_combo
            elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
              return individual_combo
            end
        end
        false
    end

    def full?
        @board.each do |space|
            if space != "X" && space != "O"
              return false
            else
              true
            end
        end
    end

    def draw?
        !won? && full?
    end

    def over?
        won? || full? || draw?
    end

    def winner
        if won?
            winning_combo = won?
              @board[winning_combo[0]]
          end
    end

    def play
        until over?
          turn
        end
        if won?
            puts "Congratulations #{winner}!"
        else
            puts "Cat's Game!"
        end
      end

end
