//
//  OXGame.swift
//  o_X
//
//  Created by Eli Wirtshafter on 6/29/16.
//  Copyright © 2016 iX. All rights reserved.
//

import Foundation


enum CellType: String {
    
    case O = "O"
    case X = "X"
    case Empty = ""
    
    var opposite: CellType {
        if self == CellType.X {
            return .O
        } else if self == .O {
            return .X
        } else {
            return .Empty
        }
    }
}

enum OXGameState {
    case InProgress, Tie, Won, open, abandoned
}

class OXGame {
    
    private var board = [CellType](count: 9, repeatedValue: .Empty)

    let startType: CellType = .X  //officialy celltype.X
    
    var ID: Int = 0
   
    var host: String = ""
    
    var turnCount: Int {
        return board.filter{ $0 != .Empty }.count
    }
    
    var nextPlayer: CellType {
        return turnCount % 2 == 0 ? startType : startType.opposite
    }
    
    func play(at position: Int) -> CellType {
        
        if state != .InProgress || board[position] != .Empty {
            return board[position]
        }
        
        board[position] = nextPlayer
        return board[position]
    }
    
    var state: OXGameState {
        
        if  (board[0]==board[1] && board[1]==board[2] && board[2] != CellType.Empty) ||
            (board[3]==board[4] && board[4]==board[5] && board[5] != CellType.Empty) ||
            (board[6]==board[7] && board[7]==board[8] && board[8] != CellType.Empty) ||
            (board[0]==board[3] && board[3]==board[6] && board[6] != CellType.Empty) ||
            (board[1]==board[4] && board[4]==board[7] && board[7] != CellType.Empty) ||
            (board[2]==board[5] && board[5]==board[8] && board[8] != CellType.Empty) ||
            (board[0]==board[4] && board[4]==board[8] && board[8] != CellType.Empty) ||
            (board[2]==board[4] && board[4]==board[6] && board[6] != CellType.Empty) {
            return .Won
        }
            
        if turnCount == 9 {
            return .Tie
        }
        
        return OXGameState.InProgress
    }
    
    
    private func deserialiseBoard(boardString:String) -> [CellType] {
        
        var board = [CellType]()
        for char in boardString.characters {
            if char == "x" {
                board.append(.X)
            }
            if char == "o"{
                board.append(.O)
            }
            else {
                board.append(.Empty)
            }
        }
        return board
    }
//        return boardString.characters.map { char in
//            if char == "X" { return .X }
//            if char == "O" { return .O }
//            return .Empty
//        }

    
    private func serialiseBoard() -> String {
        var boardString = ""
        for cell in board {
            if cell == .X {
                boardString += "x"
            }
            else if cell == .O {
                boardString += "o"
            }
            else {
                boardString += "_"
            }
        }
        return boardString
    }
    
    init()  {
        //we are simulating setting our board from the internet
        let simulatedBoardStringFromNetwork = "_________" //update this string to different values to test your model serialisation
        self.board = deserialiseBoard(simulatedBoardStringFromNetwork) //your OXGame board model should get set here
        if(simulatedBoardStringFromNetwork == serialiseBoard())    {
            print("start\n------------------------------------")
            print("congratulations, you successfully deserialised your board and serialized it again correctly. You can send your data model over the internet with this code. 1 step closer to network OX ;)")
            
            print("done\n------------------------------------")
        }   else    {
            print("start\n------------------------------------")
            print ("your board deserialisation and serialization was not correct :( carry on coding on those functions")
            
            print("done\n------------------------------------")
        }
        
    }
}



    
    
    
    
    
    
    
    
    
    
    
    
    




