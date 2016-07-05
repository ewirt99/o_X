//
//  OXGameController.swift
//  o_X
//
//  Created by Eli Wirtshafter on 6/29/16.
//  Copyright © 2016 iX. All rights reserved.
//

import UIKit

class OXGameController {
//this does nothing additional
    
    static var sharedInstance = OXGameController()
    
    private var currentGame:OXGame = OXGame()
    
    func getCurrentGame() -> OXGame {
        return currentGame
    }

    func restartGame() {
        currentGame = OXGame()
    }
    
    func playMove(location:Int) {
        currentGame.play(at: location)
    }
    
    func getGames(onCompletion onCompletion: ([OXGame]?, String?) -> Void) {
        
        let a = OXGame()
        let b = OXGame()
        let c = OXGame()
        
        a.ID = 5
        b.ID = 43
        c.ID = 7
        
        a.host = "Mom"
        b.host = "Dad"
        c.host = "Joey"
        
        onCompletion([a, b, c], nil)

    }
}
