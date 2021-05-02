//
//  VerificationViewController.swift
//  SpaoundApp
//
//  Created by Noor Walid on 05/04/2021.
//

import UIKit
import FirebaseAuth
import KKPinCodeTextField

class VerificationViewController: UIViewController, UITextFieldDelegate {
    //Delegates of the textFields
    var name: String?
    var email: String?
    var password: String?
    var phoneNumber: String?
    @IBOutlet weak var createButton: UIButton!
    @IBOutlet weak var phoneTextField: KKPinCodeTextField!
    @IBOutlet weak var verficationView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createButton.layer.cornerRadius = 16.0
        phoneTextField.delegate = self
    }
    
    @IBAction func signUpTapped(_ sender: UIButton) {
      makeVerification()
    }
    
    @IBAction func resendCodeTapped(_ sender: UIButton) {
        makeVerification()
    }
    
    @IBAction func sendTapped(_ sender: UIButton) {
        makeVerification()
        self.resignFirstResponder()
    }
    
    
    func makeVerification(){

        if let safeName = name, let safeEmail = email, let safePassword = password, let safeNumber = phoneNumber{
            PhoneAuthProvider.provider().verifyPhoneNumber(safeNumber, uiDelegate: nil) { (verificationID, error) in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                
                UserDefaults.standard.set(verificationID, forKey: "authVerificationID")
                let verificationID = UserDefaults.standard.string(forKey: "authVerificationID")
                let credential = PhoneAuthProvider.provider().credential(withVerificationID: verificationID ?? "", verificationCode: "")

                Auth.auth().signIn(with: credential) { (authResult, error) in
                    if let error = error {
                        let authError = error as NSError
                        if (authError.code == AuthErrorCode.secondFactorRequired.rawValue) {
                            // The user is a multi-factor user. Second factor challenge is required.
                            let resolver = authError.userInfo[AuthErrorUserInfoMultiFactorResolverKey] as! MultiFactorResolver
                            var displayNameString = ""
                            for tmpFactorInfo in (resolver.hints) {
                                displayNameString += tmpFactorInfo.displayName ?? ""
                                displayNameString += " "
                            }
                        } else {
                            print(error.localizedDescription)
                            self.verficationView.text = "Verification is incorrect. Try Again."
                            self.verficationView.isHidden = false
                            return
                        }
                        return
                    }
                }
                Auth.auth().createUser(withEmail: safeEmail, password: safePassword, completion: nil)
                self.verficationView.isHidden = false
                
                let destination = self.storyboard?.instantiateViewController(identifier: "HomeViewController") as! HomeViewController
                //destination.username = username from Realm
                self.navigationController?.isNavigationBarHidden = true
                self.navigationController?.present(destination, animated: true, completion: nil)
            }
        }
    }

}


