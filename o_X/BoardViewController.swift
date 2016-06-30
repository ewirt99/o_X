//
//  BoardViewController.swift
//  o_X
//

import UIKit





class BoardViewController: UIViewController {

    var gameObject = OXGame()
    
    
    @IBAction func moveButtonLabel(sender: UIButton) {
        
        let moveValue = gameObject.playMoves(sender.tag-1).rawValue
        sender.setTitle(moveValue, forState: .Normal)
        
        if gameObject.state() == .Won {
            print ("You won!")
        }
        
        if gameObject.state() == .Tie {
            print ("HAHA you tied. classic.")
        }
        
        if (gameObject.state() == .Won) {
            let alert = UIAlertController(title: "Player \(moveValue) with the Dub", message: "Now Go Get a life", preferredStyle: .Alert)
            let dismiss = UIAlertAction(title: "Dismiss", style: .Cancel, handler: nil)
            alert.addAction(dismiss)
            presentViewController(alert, animated: true, completion: nil)
            
             newGameOutlet.hidden = false
        }
        if (gameObject.state() == .Tie) {
            let alert = UIAlertController(title: "You Tied", message: "You're an Average Fucker", preferredStyle: .Alert)
            let dismiss = UIAlertAction(title: "Dismiss", style: .Cancel, handler: nil)
            alert.addAction(dismiss)
            presentViewController(alert, animated: true, completion: nil)

         newGameOutlet.hidden = false
            
        }
  
    
    }
    
    
    
    @IBAction func logoutLabel(sender: UIButton) {
    }
    
      

   
    @IBAction func newGameLabel(sender: UIButton) {
        gameObject.reset()
        print("New game button pressed.")
        
        for subview in boardView.subviews {
            if let button = subview as? UIButton {
                button.setTitle("", forState: .Normal)
                
        newGameOutlet.hidden = true

            
            }
        }
        
        
    }
   
    @IBOutlet weak var boardView: UIView!
    
    @IBOutlet weak var logoutLabel: UIButton!
    @IBOutlet weak var newGameButton: UIButton!
    // Create additional IBOutlets here.
    
    @IBOutlet weak var newGameOutlet: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newGameOutlet.hidden = true
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // Create additional IBActions here.

}

