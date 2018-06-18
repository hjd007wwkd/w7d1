require './player'
require './announce'

class Game
    def initialize()
        @player1 = Player.new
        @player2 = Player.new
        @announce = Announce.new
        @number = {num1: 0, num2: 0, answer: 0, opponent: 0}
        @turn = 1
    end

    def randomNum
        Random.rand(1..20)
    end

    def generateNum
        @number[:num1] = randomNum()
        @number[:num2] = randomNum()
        @number[:answer] = @number[:num1] + @number[:num2]
        return
    end

    def start
        puts "Game Start!"
        while true
            generateNum()
            puts @announce.question(@turn, @number[:num1], @number[:num2])
            @number[:opponent] = gets.chomp.to_i
            if (@number[:opponent] != @number[:answer])
                puts @announce.answer(0)
                @turn == 1 ? @player2.score -= 1 : @player1.score -= 1
            else
                puts @announce.answer(1)
            end
            puts @announce.score(@player1.score, @player2.score)
            
            if(@player1.score == 0)
                puts @announce.over(2, @player2.score)
                break
            elsif(@player2.score == 0)
                puts @announce.over(1, @player1.score)
                break
            else
                puts @announce.new_turn
                @turn == 1 ? @turn = 2 : @turn = 1
            end
        end
    end
end