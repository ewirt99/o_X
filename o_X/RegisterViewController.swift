//
//  RegisterViewController.swift
//  o_X
//
//  Created by Eli Wirtshafter on 6/30/16.
//  Copyright © 2016 iX. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBAction func registerButtonPressed(sender: UIButton) {
      
        
        UserController.sharedInstance.register(email: emailField.text!, password: passwordField.text!, onCompletion: { user, message in
            
            if user == nil {
                let alert = UIAlertController(title: "Error", message: message, preferredStyle: .Alert)
                let dismiss = UIAlertAction(title: "Dismiss", style: .Cancel, handler: nil)
                alert.addAction(dismiss)
                self.presentViewController(alert, animated: true, completion: nil)
            } else {
                let storyBoard = UIStoryboard(name:"Main", bundle: nil) //Just use main not Main.StoryBoard
                let viewController = storyBoard.instantiateInitialViewController()
                let application = UIApplication.sharedApplication()
                let window  = application.keyWindow
                window?.rootViewController = viewController
                print("Should log in...")
            }
        })
        
    }
    
}