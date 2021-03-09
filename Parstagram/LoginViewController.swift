//
//  LoginViewController.swift
//  Parstagram
//
//  Created by Joey Steigelman on 3/6/21.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet var cardsCollection: [UIButton]!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configureCardsCollection()
        configureTextFields()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onSignIn(_ sender: Any) {
        
        let username = usernameField.text!
        let password = passwordField.text!
        
        PFUser.logInWithUsername(inBackground: username, password: password) {
          (user, error) in
          if user != nil {
            // Do stuff after successful login.
            self.performSegue(withIdentifier: "loginSegue", sender: nil)
          } else {
            // The login failed. Check error to see why.
            print("Error: \(error?.localizedDescription)")
          }
        }
        
    }
    
    
    @IBAction func onSignup(_ sender: Any) {
        
        let user = PFUser()
        user.username = usernameField.text
        user.password = passwordField.text
        
        user.signUpInBackground { (success, error) in
            if success {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else {
                print("Error: \(error?.localizedDescription)")
            }
        }
        
    }
    
    func configureTextFields() {
        usernameField.attributedPlaceholder = NSAttributedString(string: "Username", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        usernameField.alpha = 0.7
        
        passwordField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        passwordField.alpha = 0.7


    }
    
    
    func configureCardsCollection() {
        for card in cardsCollection {
            //add rounded corners to cards
            card.layer.cornerRadius = 12
            card.layer.borderWidth = 1
            card.layer.borderColor = UIColor.white.cgColor
            card.alpha = 0.8
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


