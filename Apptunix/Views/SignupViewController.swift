//
//  SignupViewController.swift
//  Apptunix
//
//  Created by Sarthak Taneja on 14/07/21.
//

import UIKit

class SignupViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var mobileNumberTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var showPasswordBtn: UIButton!
    @IBOutlet weak var showConfirmPasswordBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let paddingView : UIView = UIView(frame: CGRect(x: 0, y: 0, width: 60, height: 20))
        mobileNumberTextField.leftView = paddingView
        mobileNumberTextField.leftViewMode = .always
    }
    
    @IBAction func signupTapped() {
        signupRequest()
    }
    
    @IBAction func loginTapped() {
        let story = UIStoryboard(name: "Main", bundle: nil)
        let signupVC = story.instantiateViewController(identifier: "LoginViewController")
        self.present(signupVC, animated: false, completion: nil)
    }
    
    @IBAction func skipTapped() {
        
    }
    
    @IBAction func showPasswordTapped() {
        showPasswordBtn.isSelected = !showPasswordBtn.isSelected
    }
    
    @IBAction func showConfirmPasswordTapped() {
        showConfirmPasswordBtn.isSelected = !showConfirmPasswordBtn.isSelected
    }
}

// MARK: - API Call
extension SignupViewController {
    func signupRequest() {
        let baseDataController = BaseDataController()
        let params = ["username": mobileNumberTextField.text!, "password": passwordTextField.text!]
       
        baseDataController.dataRequest(method: .post, url: .signup, parameters: params, authHeaders: nil) {
            token, success   in
            if success {
                AppDelegate.authToken = token
                self.showSuccessAlert()
            }
        } failure: { error in
            debugPrint(error?.localizedDescription ?? "")
        }
    }
    
    func showSuccessAlert() {
        let signupSuccessAlert = UIAlertController(title: Registration_Success, message: Login_Now, preferredStyle: .alert)
        signupSuccessAlert.addAction(UIAlertAction(title: OK, style: .cancel, handler: { _ in
            signupSuccessAlert.dismiss(animated: true, completion: nil)
        }))
        
        self.present(signupSuccessAlert, animated: true, completion: nil)
    }
}
