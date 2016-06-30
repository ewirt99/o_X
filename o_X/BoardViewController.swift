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
            let alert = UIAlertController(title: "Winnah Winnah Chicken Dinnah!", message: "Now Go Get a life", preferredStyle: .Alert)
            let dismiss = UIAlertAction(title: "Dismiss", style: .Cancel, handler: nil)
            alert.addAction(dismiss)
            presentViewController(alert, animated: true, completion: nil)
        }
        if (gameObject.state() == .Tie) {
            let alert = UIAlertController(title: "You Tied", message: "You're an Average Fucker", preferredStyle: .Alert)
            let dismiss = UIAlertAction(title: "Dismiss", style: .Cancel, handler: nil)
            alert.addAction(dismiss)
            presentViewController(alert, animated: true, completion: nil)
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
            }
        }
        
    }
   
    @IBOutlet weak var boardView: UIView!
    
    @IBOutlet weak var logoutLabel: UIButton!
    @IBOutlet weak var newGameButton: UIButton!
    // Create additional IBOutlets here.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // Create additional IBActions here.

}

