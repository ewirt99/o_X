//
//  NetworkGamesViewController.swift
//  o_X
//
//  Created by Eli Wirtshafter on 7/4/16.
//  Copyright © 2016 iX. All rights reserved.
//

import UIKit

class NetworkGamesViewController: UITableViewController {

    //Overriding classes function. This is because the class is the table view( as opposed to creating a table view outlet
    
    private var gameList = [OXGame]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let firstGame = OXGame()
//        firstGame.ID = 0
//        firstGame.host = "john"
//        gameList.append(firstGame)
        
        OXGameController.sharedInstance.getGames(onCompletion: { games, message in
            if let games = games {
                self.gameList = games
                self.tableView.reloadData()
            } else {
                //Alert cant cinnect
            }
        })
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gameList.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cellIdentifier", forIndexPath: indexPath)
        
        let oxGame = gameList[indexPath.row]
        cell.textLabel?.text = oxGame.host
        
        
        return cell
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("I selected \(indexPath.row)")
        
    }

}
