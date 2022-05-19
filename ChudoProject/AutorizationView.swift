//
//  PresentView.swift
//  ChudoProject
//
//  Created by SIMONOV on 08.05.2022.
//

import UIKit
import AutoLayoutSugar

class AutorizationView: UIViewController {
    
    var textField: String = ""
    
    let user: Users = Users(login: "You", password: "000")
    
    struct Users {
        let login: String
        let password: String
    }
    
    private lazy var myImageView: UIImageView = {
        let myImageView = UIImageView(frame: view.bounds)
        myImageView.image = UIImage(named: "god")
        myImageView.contentMode = .scaleAspectFill
        return myImageView
    }()
    
    private lazy var welcomeLabel: UILabel = {
        let welcomeLabel = UILabel()
        welcomeLabel.text = "The Way to God"
        welcomeLabel.textAlignment = .center
        welcomeLabel.textColor = .red
        welcomeLabel.shadowColor = .white
        welcomeLabel.font = .systemFont(ofSize: 30)
        
        view.addSubview(welcomeLabel)

        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false

        let welcomeText = UIEdgeInsets(top: 80, left: 10, bottom: 0, right: 10 )
        welcomeLabel.pin(excluding: .bottom, insets: welcomeText, to: view)

        return welcomeLabel
    }()
    
    private lazy var alertLabel: UILabel = {
        let alertLabel = UILabel()
        alertLabel.text = "Enter your name and password"
        alertLabel.textAlignment = .center
        alertLabel.textColor = .red
        alertLabel.shadowColor = .white
        alertLabel.font = .systemFont(ofSize: 20)
        view.addSubview(alertLabel)

        alertLabel.translatesAutoresizingMaskIntoConstraints = false

        let welcomeText = UIEdgeInsets(top: 300, left: 10, bottom: 0, right: 10 )
        alertLabel.pin(excluding: .bottom, insets: welcomeText, to: view)

        return alertLabel
    }()
    
    private lazy var loginTextField: UITextField = {
        let loginTextField = UITextField()
        loginTextField.placeholder = "Name"
        loginTextField.backgroundColor = .white
        loginTextField.alpha = 0.8
        loginTextField.layer.cornerRadius = 10
        loginTextField.height(30)
        view.addSubview(loginTextField)
        
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        
        let textFiledLoginInsets = UIEdgeInsets(top: 350, left: 80, bottom: 0, right: 80)
        loginTextField.pin(excluding: .bottom, insets: textFiledLoginInsets, to: view)
        return loginTextField
    }()

    
    private lazy var passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.placeholder = "Password"
        passwordTextField.backgroundColor = .white
        passwordTextField.alpha = 0.8
        passwordTextField.layer.cornerRadius = 10
        passwordTextField.height(30)
        view.addSubview(passwordTextField)
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        let textFiledpasswordInsets = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        passwordTextField.pin(excluding: .bottom, insets: textFiledpasswordInsets, to: loginTextField)
        return passwordTextField
    }()
    
    private lazy var button: UIButton = {
        
        let button = UIButton()
        button.backgroundColor = .red
        button.alpha = 0.8
        button.setTitleShadowColor(.white, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Enter", for: .normal)
        button.addTarget(self, action: #selector(checkToAutorize), for: .touchUpInside)
        button.layer.cornerRadius = 12
        view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let buttonInsets = UIEdgeInsets(top: 50, left: 70, bottom: 0, right: 70)
        button.pin(excluding: .bottom, insets: buttonInsets, to: passwordTextField)
        
        return button
    }()
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.prepareForAutoLayout()
        view.addSubview(myImageView)
        view.addSubview(button)
        view.addSubview(loginTextField)
        view.addSubview(passwordTextField)
        view.addSubview(welcomeLabel)
        view.addSubview(alertLabel)
       
    }
    
    // MARK: - @IBAction
    
    
    private func errorLogin() {
        alertLabel.isHidden = false
        alertLabel.textColor = .red
        alertLabel.shadowColor = .white
        alertLabel.text = "Incorrect login or password"
//
    }


    @objc private func checkToAutorize()  {
        if loginTextField.text?.lowercased() == "" && passwordTextField.text?.lowercased() == "" {
            self.alertLabel.text = "Enter your name and password"
            }
        else if   loginTextField.text?.lowercased() == user.login.lowercased() && passwordTextField.text == user.password {
            
            let nextViewController: PresentView = PresentView()
            guard let text = loginTextField.text else { return }
            nextViewController.name = text
            nextViewController.modalPresentationStyle = .fullScreen
            nextViewController.modalTransitionStyle = .partialCurl
            present(nextViewController, animated: true, completion: nil)
            
        } else { errorLogin()
            
        
        
           }
        }
    }

    


