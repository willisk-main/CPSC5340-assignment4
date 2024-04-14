//
//  AuthViewController.swift
//  assignment4
//
//  Created by Willis Kim on 4/13/24.
//

import UIKit
import Firebase
import FirebaseAuth

class AuthViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextField.delegate = self

        // Add a tap gesture recognizer to dismiss the keyboard when tapping outside the text fields
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }

    @IBAction func loginButtonTapped(_ sender: UIButton) {
        login()
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == passwordTextField {
            textField.resignFirstResponder()
            login()
            return false
        }
        return true
    }

    func login() {
        guard let email = emailTextField.text, let password = passwordTextField.text else {
            return
        }

        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            if let error = error {
                print("Error logging in: \(error.localizedDescription)")
            } else {
                print("Login successful!")
                // Optionally, you can navigate to the main part of your app here
            }
        }
    }
}
