class Mastermind
    attr_accessor :code
    def initialize
        @responses = Hash.new
        @responses[:correct] = -1
        @responses[:color] = -2
        @responses[:wrong] = -3

        @counter = 0

        @code = []
        4.times do
            @code << rand(4) + 1
        end        
    end

    def play player
        player ? play_player : play_PC
    end

    private

    def play_PC
        @ai_code = [0,0,0,0]
        get_code
        while @counter < 12
            generate_code
            puts "PC code: #{@ai_code}"
            if check_for_win @ai_code
                puts "PC wins"
                return
            end
            return_tips @ai_code

            @counter += 1
        end
        puts "PC lost"
    end
    def get_code
        puts "Enter your code (Ex. 1 2 3 4)"
        @code.clear
        code = gets.chomp.split
        code.each do |element|
            @code << element.to_i
        end
    end

    def generate_code
        
        code = []
        @ai_code.each do |element|
            code << element
        end
        @ai_code.clear

        code.each_with_index do |element, index|
            if element == @code[index]
                @ai_code << element
            else
                
                @ai_code << rand(4) + 1
            end
        end
    end

    def play_player
        introduction
        while @counter < 12 
            solution = []
            puts "Enter your numbers (Ex 1 3 2 4)"
            gets.chomp.split.each do |element|
                solution << element.to_i
            end
            if check_for_win solution
                puts "You win!"
                return
            end
            return_tips solution
            @counter += 1
        end
        puts "You lost!"
    end
    
    def check_for_win solution
        solution == @code ? true : false
    end
    def return_tips solution
        solution.each_with_index do |element, index|
            if element == @code[index]
                print "#{@responses[:correct]} "
            elsif @code.any?(element)
                print "#{@responses[:color]} "
            else
                print "#{@responses[:wrong]} "
            end
        end
        print "\n"
    end
    def introduction
        puts "You will enter a value from 1 to 4 separeted by a blank space, whenever you do the game will tell you with a"
        puts "negative number if you guessed the correct position and color (-1), the correct color (-2) or if" 
        puts "you guessed none (-3)"
    end
end

game = Mastermind.new
game.play false