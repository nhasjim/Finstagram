//
//  LoginVC.swift
//  Finstagram
//
//  Created by Nick Hasjim on 3/9/17.
//  Copyright © 2017 Nick Hasjim. All rights reserved.
//

import UIKit
import Parse
class LoginVC: UIViewController {

    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var username: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSignIn(_ sender: Any) {
        PFUser.logInWithUsername(inBackground: self.username.text!, password: self.password.text!) { (user:PFUser?, error: Error?) in
            if (user != nil){
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
                print("you are logged in sir")
            } else {
                
            }
        }
    }


    @IBAction func onSignUp(_ sender: Any) {
        let newUser = PFUser();
        newUser.username = username.text
        newUser.password = password.text
        
        newUser.signUpInBackground { (success: Bool, error: Error?) in
            if(success) {
                print("Created a user ")
            } else {
                print(error?.localizedDescription as Any)
                if(error?._code == 202) {
                    print("Username taken")
                }
            }
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if(segue.identifier == "loginSegue"){
        }
    }


}
