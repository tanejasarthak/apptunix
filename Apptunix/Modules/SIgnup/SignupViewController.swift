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
    
    var viewModel = SignupViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let paddingView : UIView = UIView(frame: CGRect(x: 0, y: 0, width: 60, height: 20))
        mobileNumberTextField.leftView = paddingView
        mobileNumberTextField.leftViewMode = .always
    }
    
    @IBAction func signupTapped() {
        let result = viewModel.validateSignup(mobileNumber: mobileNumberTextField.text ?? "", confirmPassword: confirmPasswordTextField.text ?? "", password: passwordTextField.text ?? "")
        
        if !result.status {
            showValidationAlert(message: result.message ?? "")
            return
        }
        signupRequest()
    }
    
    @IBAction func loginTapped() {
        let story = UIStoryboard(name: "Main", bundle: nil)
        let signupVC = story.instantiateViewController(identifier: "LoginViewController")
        self.present(signupVC, animated: false, completion: nil)
    }
    
    @IBAction func skipTapped() {
        let story = UIStoryboard(name: "Main", bundle: nil)
        let homeVC = story.instantiateViewController(withIdentifier: "HomeScreenViewController")
        self.present(homeVC, animated: false, completion: nil)
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
       
        baseDataController.dataRequest(url: .signup, httpMethod: .post, parameters: params, imageEndPoint: nil, authHeaders: nil) {
            data, success   in
            guard let data = data else { return }
            if success {
              //  AppDelegate.authToken = data["token"] as? String ?? ""
                UserDefaults.standard.setValue(data["token"] as? String ?? "", forKey: "appToken")
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
    
    func showValidationAlert(message: String) {
        let validationAlert = UIAlertController(title: Oops, message: message, preferredStyle: .alert)
        validationAlert.addAction(UIAlertAction(title: OK, style: .cancel, handler: { _ in
            validationAlert.dismiss(animated: true, completion: nil)
        }))
        
        self.present(validationAlert, animated: true, completion: nil)
    }
}
