//
//  OXGameController.swift
//  o_X
//
//  Created by Eli Wirtshafter on 6/29/16.
//  Copyright © 2016 iX. All rights reserved.
//

import UIKit

class OXGameController: NSObject {
//this does nothing additional
    
    static var sharedInstance = OXGameController()
    
    private var currentGame:OXGame = OXGame()
    
    func getCurrentGame() -> OXGame {
        return currentGame
    }

    func restartGame(){
        currentGame.reset()
    }
    
    func playMove (location:Int) {
        currentGame.playMoves(location)
    }
}
