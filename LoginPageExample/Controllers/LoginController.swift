//
//  ViewController.swift
//  LoginPageExample
//
//  Created by Jon McLean on 6/1/19.
//  Copyright © 2019 Jon McLean Development. All rights reserved.
//

import UIKit

class LoginController: UIViewController, UITextFieldDelegate {

    var backgroundImageView: UIImageView = UIImageView()
    var logoView: UIImageView = UIImageView()
    var emailField: UnderlinedTextField = UnderlinedTextField()
    var passwordField: UnderlinedTextField = UnderlinedTextField()
    var emailLabel: UILabel = UILabel()
    var passwordLabel: UILabel = UILabel()
    
    var loginButton: RoundedButton = RoundedButton()
    var forgotPasswordButton: UIButton = UIButton()
    var signupButton: UIButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //NotificationCenter.default.addObserver(self, selector: Selector("keyboardWillShow:"), name: UIKeyboardWillShowNotification, object: nil)
        //NotificationCenter.default.addObserver(self, selector: Selector("keyboardWillHide:"), name: UIKeyboardWillHideNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        self.navigationController?.isNavigationBarHidden = true
        self.view.backgroundColor = UIColor.white
        self.hideKeyboardWhenTappedAround()
        
        backgroundImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height))
        backgroundImageView.image = UIImage(named: "background2")!
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.addBlurEffect()
        
        self.view.addSubview(backgroundImageView)
        
        logoView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width - 30, height: 70))
        logoView.image = UIImage(named: "logo")!
        logoView.image = logoView.image!.withRenderingMode(.alwaysTemplate)
        logoView.tintColor = UIColor.white
        logoView.contentMode = .scaleAspectFill
        self.view.addSubview(logoView)
        
        emailField = UnderlinedTextField(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width - 45, height: 45))
        emailField.borderStyle = .none
        emailField.autocapitalizationType = .none
        emailField.autocorrectionType = .no
        emailField.keyboardType = .emailAddress
        emailField.returnKeyType = .done
        emailField.clearButtonMode = .whileEditing
        emailField.contentVerticalAlignment = .center
        emailField.layer.cornerRadius = 1.5
        emailField.textColor = UIColor.white
        emailField.font = UIFont(name: "Courier New", size: 17)
        emailField.delegate = self
        emailField.tintColor = UIColor.white
        self.view.addSubview(emailField)
        
        emailLabel = UILabel(frame: CGRect(x: 0, y: 0, width: emailField.bounds.width, height: 14))
        emailLabel.text = "EMAIL"
        emailLabel.font = UIFont(name: "Courier New", size: 13)
        emailLabel.textColor = UIColor.white
        self.view.addSubview(emailLabel)
        
        passwordField = UnderlinedTextField(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width - 45, height: 45))
        passwordField.borderStyle = .none
        passwordField.autocapitalizationType = .none
        passwordField.autocorrectionType = .no
        passwordField.keyboardType = .default
        passwordField.returnKeyType = .done
        passwordField.clearButtonMode = .whileEditing
        passwordField.contentVerticalAlignment = .center
        passwordField.layer.cornerRadius = 1.5
        passwordField.textColor = UIColor.white
        passwordField.font = UIFont(name: "Courier New", size: 17)
        passwordField.delegate = self
        passwordField.tintColor = UIColor.white
        passwordField.isSecureTextEntry = true
        self.view.addSubview(passwordField)
        
        passwordLabel = UILabel(frame: CGRect(x: 0, y: 0, width: passwordField.bounds.width, height: 14))
        passwordLabel.text = "PASSWORD"
        passwordLabel.font = UIFont(name: "Courier New", size: 13)
        passwordLabel.textColor = UIColor.white
        self.view.addSubview(passwordLabel)
        
        loginButton = RoundedButton(frame: CGRect(x: 0, y: 0, width: emailField.bounds.width - 50, height: 50))
        loginButton.setTitle("Sign in", for: .normal)
        loginButton.backgroundColor = Colors.Theme.lightRedColor
        loginButton.setTitleColor(UIColor.white, for: .normal)
        loginButton.titleLabel?.font = UIFont(name: "Courier New", size: 18)
        loginButton.addTarget(self, action: #selector(signIn), for: .touchUpInside)
        self.view.addSubview(loginButton)
        
        signupButton = UIButton(frame: CGRect(x: 0, y: 0, width: loginButton.bounds.width, height: 25))
        signupButton.setTitle("Need an account? Sign up!", for: .normal)
        signupButton.setTitleColor(UIColor.white, for: .normal)
        signupButton.titleLabel?.font = UIFont(name: "Courier New", size: 13)
        signupButton.addTarget(self, action: #selector(signUp), for: .touchUpInside)
        self.view.addSubview(signupButton)
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        layoutViews()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func layoutViews() {
        
        backgroundImageView.snp.makeConstraints { (make) in
            make.width.equalTo(backgroundImageView.bounds.width)
            make.height.equalTo(backgroundImageView.bounds.height)
            make.center.equalTo(self.view)
        }
        
        logoView.snp.makeConstraints { (make) in
            make.width.equalTo(logoView.bounds.width)
            make.height.equalTo(logoView.bounds.height)
            make.centerX.equalTo(self.view)
            make.centerY.equalTo(self.view.center.y / 2 - 50)
        }
        
        emailField.snp.makeConstraints { (make) in
            make.width.equalTo(emailField.bounds.width)
            make.height.equalTo(emailField.bounds.height)
            make.centerX.equalTo(self.view)
            make.centerY.equalTo(self.view.center.y + (self.view.center.y / 2 - 75))
        }
        
        emailLabel.snp.makeConstraints { (make) in
            make.width.equalTo(emailLabel.bounds.width)
            make.height.equalTo(emailLabel.bounds.height)
            make.bottom.equalTo(emailField.snp.top)
            make.centerX.equalTo(self.view)
        }
        
        passwordField.snp.makeConstraints { (make) in
            make.width.equalTo(passwordField.bounds.width)
            make.height.equalTo(passwordField.bounds.height)
            make.centerX.equalTo(self.view)
            make.top.equalTo(emailField.snp.bottom).offset(60)
        }
        
        passwordLabel.snp.makeConstraints { (make) in
            make.width.equalTo(passwordLabel.bounds.width)
            make.height.equalTo(passwordLabel.bounds.height)
            make.bottom.equalTo(passwordField.snp.top)
            make.centerX.equalTo(self.view)
        }
        
        loginButton.snp.makeConstraints { (make) in
            make.width.equalTo(loginButton.bounds.width)
            make.height.equalTo(loginButton.bounds.height)
            make.centerX.equalTo(self.view)
            make.top.equalTo(passwordField.snp.bottom).offset(30)
        }
        
        signupButton.snp.makeConstraints { (make) in
            make.width.equalTo(signupButton.bounds.width)
            make.height.equalTo(signupButton.bounds.height)
            make.centerX.equalTo(self.view)
            make.top.equalTo(loginButton.snp.bottom).offset(15)
        }
        
        
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        self.hideKeyboard()
        
        return true
    }
    
    @objc func signIn() {
        
    }
    
    @objc func signUp() {
        
    }
    
    @objc func forgotPassword() {
        
    }

}

