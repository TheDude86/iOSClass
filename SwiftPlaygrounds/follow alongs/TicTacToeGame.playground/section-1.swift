

// TODO: Create the TicTacToeGame class

class TicTacToeGame {
    enum MarkType : String {
        case None = "-"
        case X = "X"
        case O = "O"
    }
    
    enum GameState: String {
        case XTurn = "X TURN"
        case OTurn = "O TURN"
        case XWon = "X WON"
        case OWon = "O WON"
        case Tie = "TIE"
    }
    
    var gameBoard = [MarkType]()
    var gameState : GameState
    
    var description: String {
        return "\(gameState.rawValue) Board: \(getGameStateString())"
    }
    
    init() {
        for _ in 0..<9 {
            gameBoard.append(MarkType.None)
        }
        
        gameState = .XTurn
    }
    
    func pressedSquare(index: Int) {
        if gameBoard[index] != .None {
            return
        }
        
        gameBoard[index] = gameState == .XTurn ? .X : .O
        gameState = gameState == .XTurn ? .OTurn : .XTurn
        checkGO()
    }
    
    func checkGO() {
        if !gameBoard.contains(.None) {
            gameState = .Tie
        }
        
        var l3 = [String]()
        l3.append(getGameStateString(indexes: [0,1,2]))
        l3.append(getGameStateString(indexes: [3,4,5]))
        l3.append(getGameStateString(indexes: [6,7,8]))

        l3.append(getGameStateString(indexes: [0,3,6]))
        l3.append(getGameStateString(indexes: [1,4,7]))
        l3.append(getGameStateString(indexes: [2,5,8]))

        l3.append(getGameStateString(indexes: [0,4,8]))
        l3.append(getGameStateString(indexes: [2,4,6]))
        
        for l in l3 {
            if l == "XXX" {
                gameState = .XWon
            } else if l == "OOO" {
                gameState = .OWon
            }
        }

    }
    
    func getGameStateString(indexes : [Int] = [0, 1, 2, 3, 4, 5, 6, 7, 8]) -> String {
        var str = ""
        for i in indexes {
            str += gameBoard[i].rawValue
        }
        
        return str
    }
}



/* ----------------- Official Playground testing ----------------- */
var game = TicTacToeGame()
game.description
game.pressedSquare(index: 0)
game.description
game.pressedSquare(index: 1)
game.description
game.pressedSquare(index: 3)
game.description
game.pressedSquare(index: 2)
game.description
game.pressedSquare(index: 6)
game.description


var game2 = TicTacToeGame()
game2.gameBoard = [.X, .X, .O,
                .None, .None, .None,
                .O, .None, .None]
game2.description
game2.pressedSquare(index: 8)
game2.description
game2.pressedSquare(index: 4)
game2.description


var game3 = TicTacToeGame()
game3.gameBoard = [.X, .X, .O,
    .O, .O, .X,
    .X, .O, .None]
game3.description
game3.pressedSquare(index: 8)
game3.description
