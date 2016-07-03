//
//  BoardViewController.swift
//  o_X
//

import UIKit

class BoardViewController: UIViewController {
    
    @IBOutlet weak var boardView: UIView!
    @IBOutlet weak var newGameOutlet: UIButton!
    
    var gameObject = OXGame()
    
    @IBAction func moveButtonLabel(sender: UIButton) {
        
        let moveValue = gameObject.play(at: sender.tag-1).rawValue
        sender.setTitle(moveValue, forState: .Normal) //explain
        
        if gameObject.state == .Won {
            let alert = UIAlertController(title: "Player \(moveValue) with the Dub", message: "Now Go Get a life", preferredStyle: .Alert)
            let dismiss = UIAlertAction(title: "Dismiss", style: .Cancel, handler: { action in
                self.newGameOutlet.hidden = false
            })
            alert.addAction(dismiss)
            presentViewController(alert, animated: true, completion: nil)
            
            
        } else if gameObject.state == .Tie {
            let alert = UIAlertController(title: "You Tied", message: "You're an Average Joe", preferredStyle: .Alert)
            let dismiss = UIAlertAction(title: "Dismiss", style: .Cancel, handler: { action in
                self.newGameOutlet.hidden = false
            })
            alert.addAction(dismiss)
            presentViewController(alert, animated: true, completion: nil)

        
            
        }
    }
    
    @IBAction func logoutLabel(sender: UIButton) {
        let storyBoard = UIStoryboard(name:"Onboarding", bundle: nil) //Just use main not Main.StoryBoard
        let viewController = storyBoard.instantiateInitialViewController()
        let application = UIApplication.sharedApplication()
        let window  = application.keyWindow
        window?.rootViewController = viewController
        print("Should log in...")

    }
   
    @IBAction func newGameLabel(sender: UIButton) {
        gameObject = OXGame()
        print("New game button pressed.")
        
        for subview in boardView.subviews {
            if let button = subview as? UIButton {
                button.setTitle("", forState: .Normal)
                    newGameOutlet.hidden = true
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newGameOutlet.hidden = true
    }
}

