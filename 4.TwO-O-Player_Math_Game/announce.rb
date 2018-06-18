class Announce 
    def question(player, num1, num2)
        "Player #{player}: What does #{num1} plus #{num2} equal?"
    end

    def answer(stat)
        stat == 1 ? "YES! You are correct." : "Seriously? No!"
    end

    def score(player1, player2)
        "P1: #{player1}/3 vs P2: #{player2}/3"
    end

    def new_turn
        "----- NEW TURN -----"
    end

    def over(player, score)
        "Player #{player} wins with a score of #{score}/3\n----- GAME OVER -----\nGood Bye!"
    end
end