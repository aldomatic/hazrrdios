//
//  SignUpViewController.swift
//  Hazrrdproto
//
//  Created by Aldo Lugo on 1/18/16.
//  Copyright © 2016 Aldo Lugo. All rights reserved.
//

import UIKit
import Parse

class SignUpViewController: UIViewController {

    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func signUpBtn(sender: UIButton) {
        guard let nameFirst = self.firstNameField.text where nameFirst != "" else{
            showAlert("First Name")
            return
        }
        guard let nameLast = lastNameField.text where nameLast != "" else{
            showAlert("Last Name")
            return
        }
        guard let emailField = emailField.text where emailField != "" else{
            showAlert("Email")
            return
        }
        guard let phone = phoneField.text where phone != "" else{
            showAlert("Phone")
            return
        }
        guard let password = passwordField.text where password != "" else{
            showAlert("Password")
            return
        }
        
        signUpWith(nameFirst, lastname: nameLast, password: password, phone: phone, email: emailField)
    }
    
    
    func showAlert(message:String){
        let alert = UIAlertController(title: "Missing Field", message: message, preferredStyle: UIAlertControllerStyle.Alert)
        let cancelAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
        alert.addAction(cancelAction)
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    
    func signUpWith(firstname: String, lastname: String, password: String, phone: String, email:String){
        let newUser = PFUser()
        newUser.password = password
        newUser.email = email
        newUser.username = phone
        newUser["firstname"] = firstname
        newUser["lastname"] = lastname
        newUser["phone"] = phone
        
        newUser.signUpInBackgroundWithBlock { (success: Bool, serviceError: NSError?) -> Void in
            if let error = serviceError {
                print(error)
            } else {
                if success{
                    self.performSegueWithIdentifier("mapSegue", sender: nil)
                }

            }
        }
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
