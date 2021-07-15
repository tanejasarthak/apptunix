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
        loginRequest()
    }
    
    @IBAction func signupTapped() {
        let story = UIStoryboard(name: "Main", bundle: nil)
        let signupVC = story.instantiateViewController(identifier: "SignupViewController")
        self.present(signupVC, animated: false, completion: nil)
    }
    
    @IBAction func forgotPasswordTapped() {
        
    }
    
    @IBAction func skipTapped() {
        let story = UIStoryboard(name: "Main", bundle: nil)
        let homeVC = story.instantiateViewController(withIdentifier: "HomeScreenViewController")
        self.present(homeVC, animated: false, completion: nil)
    }
}

// MARK: - API Call
extension LoginViewController {
    func loginRequest() {
        let baseDataController = BaseDataController()
        let params = ["username": mobileNumberTextField.text!, "password": passwordTextField.text!]
        let authToken = UserDefaults.standard.value(forKey: "appToken") as! String
        baseDataController.dataRequest(url: .login, httpMethod: .post, parameters: params, imageEndPoint: nil, authHeaders: authToken) { data, success in
            if success == false {
                self.showNoUserAlert()
            }
        } failure: { error in
            debugPrint(error?.localizedDescription ?? "")
        }
    }
    
    func showNoUserAlert() {
        let noUserFoundAlert = UIAlertController(title: No_User_Found, message: Try_Signup, preferredStyle: .alert)
        noUserFoundAlert.addAction(UIAlertAction(title: OK, style: .cancel, handler: { _ in
            noUserFoundAlert.dismiss(animated: true, completion: nil)
        }))
        
        self.present(noUserFoundAlert, animated: true, completion: nil)
    }
}
