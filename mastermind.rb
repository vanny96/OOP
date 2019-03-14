class Mastermind
    attr_accessor :code
    def initialize
        @responses = Hash.new
        @responses[:correct] = assign_color
        @responses[:color] = assign_color
        @responses[:wrong] = assign_color

        @counter = 0

        @code = []
        4.times do
            @code << rand(4) + 1
        end
        introduction
    end

    def play
        while @counter < 10 do
            solution = []
            puts "Enter your numbers (Ex 1 3 2 4)"
            gets.chomp.split.each do |element|
                solution << element.to_i
            end
            if check_for_win solution
                puts "You win!"
                break
            end
            return_tips solution
            @counter += 1
        end
    end

    private
    def assign_color
        loop do
            value = rand(3) - 3
            if !@responses.values.any?(value)
                return value
            end
        end 
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
        puts "random negative number (between -1 and -3) if you guessed the correct position and color, the correct color or if" 
        puts "you guessed none"
    end
end

game = Mastermind.new
puts game.code
game.play