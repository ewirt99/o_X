//
//  BoardViewController.swift
//  o_X
//

import UIKit







class BoardViewController: UIViewController {


    
    
    @IBAction func moveButtonLabel(sender: UIButton) {
        
        print("Board clicked" + String(sender.tag))
        
    }
    
    @IBAction func logoutLabel(sender: AnyObject) {
    }
    
   
    @IBAction func newGameLabel(sender: AnyObject) {
    }
   
    
    @IBOutlet weak var logoutLabel: UIButton!
    
    
    
    @IBOutlet weak var newGameButton: UIButton!
    // Create additional IBOutlets here.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func newGameButtonPressed(sender: UIButton) {
        print("New game button pressed.")
    }
    
    // Create additional IBActions here.

}

