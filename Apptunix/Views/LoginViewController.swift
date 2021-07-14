//
//  LoginViewController.swift
//  Apptunix
//
//  Created by Sarthak Taneja on 14/07/21.
//

import UIKit

class LoginViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var mobileNumberTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let paddingView : UIView = UIView(frame: CGRect(x: 0, y: 0, width: 35, height: 20))
        mobileNumberTextField.leftView = paddingView
        mobileNumberTextField.leftViewMode = .always
    }
    
    // MARK: - IBActions
    @IBAction func loginTapped() {
        
    }
    
    @IBAction func signupTapped() {
        let story = UIStoryboard(name: "Main", bundle: nil)
        let signupVC = story.instantiateViewController(identifier: "SignupViewController")
        self.present(signupVC, animated: false, completion: nil)
    }
    
    @IBAction func forgotPasswordTapped() {
        
    }
    
    @IBAction func skipTapped() {
        
    }
}
