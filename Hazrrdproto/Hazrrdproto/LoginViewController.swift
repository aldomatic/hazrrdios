//
//  LoginViewController.swift
//  Hazrrdproto
//
//  Created by aldomatic on 1/14/16.
//  Copyright © 2016 Aldo Lugo. All rights reserved.
//

import UIKit

protocol LoginViewControllerDelegate{
    func loginStatus(status: Bool, message: String)
}

class LoginViewController: UIViewController {

    // set the delegate
    var delegate: LoginViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    @IBAction func loginBtn(sender: UIButton) {
        self.delegate?.loginStatus(true, message: "Login was a success! Continue on to map.")
        self.dismissViewControllerAnimated(true, completion: nil)
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
