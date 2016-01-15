//
//  SplashScreenController.swift
//  Hazrrdproto
//
//  Created by aldomatic on 1/14/16.
//  Copyright © 2016 Aldo Lugo. All rights reserved.
//

import UIKit

class SplashScreenController: UIViewController, LoginViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loginStatus(status: Bool, message: String) {
        if status{
            self.performSegueWithIdentifier("mapSegue", sender: nil)
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
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    @IBAction func showLoginCtrl(sender: AnyObject) {
        let loginCtrl = self.storyboard?.instantiateViewControllerWithIdentifier("loginView") as! LoginViewController
        loginCtrl.delegate = self
        self.presentViewController(loginCtrl, animated: true, completion: nil)
    }
}
