//
//  OXGame.swift
//  o_X
//
//  Created by Eli Wirtshafter on 6/29/16.
//  Copyright © 2016 iX. All rights reserved.
//

import Foundation

enum CellType : String {
    
    case O = "O"
    case X = "X"
    case Empty = ""
    
    var opposite: CellType{
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
    
    case InProgress
    case Tie
    case Won
}



class OXGame {
    
    private var board: [CellType] = [CellType](count: 9, repeatedValue: .Empty)

    let startType: CellType = .X  //officialy celltype.X
    
    var countTurn: Int = 0
    
    
    func turnCount()-> Int{
        return self.countTurn
    }
    
    func whoseTurn() -> CellType {
        if countTurn % 2 == 0 {
            return startType
        } else {
            return startType.opposite
        }
    }
    
    func playMoves(cellNum: Int) -> CellType {
        
        if state() != .InProgress || board[cellNum] != .Empty {
            return board[cellNum]
        }
        
        
        countTurn += 1
        print(countTurn)
        if countTurn % 2 == 1 {
            board[cellNum] = startType
            return startType
        } else {
            board[cellNum] = startType.opposite
            return startType.opposite
        }
    }
    
    func gameWon() -> Bool {
        return (board[0]==board[1] && board[1]==board[2] && board[2] != CellType.Empty) ||
            (board[3]==board[4] && board[4]==board[5] && board[5] != CellType.Empty) ||
            (board[6]==board[7] && board[7]==board[8] && board[8] != CellType.Empty) ||
            (board[0]==board[3] && board[3]==board[6] && board[6] != CellType.Empty) ||
            (board[1]==board[4] && board[4]==board[7] && board[7] != CellType.Empty) ||
            (board[2]==board[5] && board[5]==board[8] && board[8] != CellType.Empty) ||
            (board[0]==board[4] && board[4]==board[8] && board[8] != CellType.Empty) ||
            (board[2]==board[4] && board[4]==board[6] && board[6] != CellType.Empty)
    }
    func state()->OXGameState {
        if(gameWon()){
            return OXGameState.Won
        }
        else if(turnCount()>=9){
            return OXGameState.Tie
        }
        else {
            return OXGameState.InProgress
        }
    }
    func reset() {
        board=[CellType](count: 9, repeatedValue: .Empty)
        countTurn=0
    }
}
    
    
    
    
    
    
    
    
    
    
    
    
    
    




