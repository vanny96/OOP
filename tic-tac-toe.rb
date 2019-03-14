class Tic_tac_toe

    def initialize
        @symbols_array = [[],[],[]]
        @symbols_array.each do |element|
            3.times do
                element.push " "
            end
        end
    end

    def display_table
        @symbols_array.each do |element|
            print "#{element[0]}|#{element[1]}|#{element[2]}\n"
        end
        return
    end
    
    def new_game
        player = (rand 2) + 1
        puts "Starts player #{player}"
        loop do
            player_play player
            if check_game(player == 1 ? "O" : "X") == 1
                puts "Player #{player} wins"
                break
            elsif check_game(player == 1 ? "O" : "X") == 0
                puts "The game ended in a draw"
                break
            end
            player = player == 1 ? 2 : 1
        end
    end

    def check_game symbol
        
        if @symbols_array[0].all?(symbol) ||
            @symbols_array[1].all?(symbol) ||
            @symbols_array[2].all?(symbol) ||
            (@symbols_array[0][0] == @symbols_array[1][0] && @symbols_array[1][0] == @symbols_array[2][0] && @symbols_array[2][0] == symbol) ||
            (@symbols_array[0][1] == @symbols_array[1][1] && @symbols_array[1][1] == @symbols_array[2][1] && @symbols_array[2][1] == symbol) ||
            (@symbols_array[0][2] == @symbols_array[1][2] && @symbols_array[1][2] == @symbols_array[2][2] && @symbols_array[2][2] == symbol) ||
            (@symbols_array[0][0] == @symbols_array[1][1] && @symbols_array[1][1] == @symbols_array[2][2] && @symbols_array[2][2] == symbol) ||
            (@symbols_array[2][0] == @symbols_array[1][1] && @symbols_array[1][1] == @symbols_array[0][2] && @symbols_array[0][2] == symbol)

            return 1
        elsif @symbols_array[0].none?(" ") &&
              @symbols_array[1].none?(" ") &&
              @symbols_array[2].none?(" ")
              return 0
        else
            return -1
        end
    end    
    
    def get_coordinate
        loop do
            puts "Where do you want to place your sign? (Ex. A 1)"
            coordinate = gets.chomp
            if /[A-C] [1-3]/.match(coordinate).to_s != coordinate
                puts "Wrong format"
            else 
                coordinates = coordinate.split
                coordinates[0] = (coordinates[0].ord - 17).chr.to_i
                coordinates[1] = coordinates[1].to_i - 1
                return coordinates
            end
        end
    end
    def player_play player 
        loop do
            coordinates = get_coordinate
            if @symbols_array[coordinates[0]][coordinates[1]] == " "
                @symbols_array[coordinates[0]][coordinates[1]] = player == 1 ? "O" : "X"
                display_table
                break
            else
                puts "Already taken"
            end
        end
    end
end

game = Tic_tac_toe.new 
game.new_game