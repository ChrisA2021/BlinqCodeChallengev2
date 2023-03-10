//
//  RequestFormViewController.swift
//  BlinqCodeChallengev2
//
//  Created by Chrishane Amarasekara on 11/1/2023.
//

import UIKit

protocol RequestFormDelegate {
    func isUserRegistered()
}

class RequestFormViewController: UIViewController {
    
    @IBOutlet weak var userName: UITextField!
    
    @IBOutlet weak var userEmail: UITextField!
    
    @IBOutlet weak var userConfirmEmail: UITextField!
    
    
    @IBOutlet weak var userNameError: UILabel!
    
    @IBOutlet weak var userEmailError: UILabel!
    
    @IBOutlet weak var userConfirmEmailError: UILabel!
    
    @IBOutlet weak var requestInviteButton: UIButton!
    
    @IBOutlet weak var requestMessage: UILabel!
    
    var delegate: RequestFormDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetForm()
        
    }
    
    func resetForm() {
        requestInviteButton.isEnabled = false
        
        userNameError.isHidden = true
        userEmailError.isHidden = true
        userConfirmEmailError.isHidden = true
        
        requestMessage.isHidden = true
    }
    
    func isEmailValid(emailStr: String) -> Bool {
        let emailRegx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegx)
        
        return emailTest.evaluate(with: emailStr)
    }
    
    func checkFormValid() {
        if (userName.text?.count ?? 0 >= 3 && isEmailValid(emailStr: userEmail.text ?? "") && (userConfirmEmail.text == userEmail.text)) {
            requestInviteButton.isEnabled = true
        }
        else {
            requestInviteButton.isEnabled = false
        }
    }
    
    @IBAction func userNameChanged(_ sender: Any) {
        if (userName.text?.count ?? 0 < 3) {
            userNameError.isHidden = false
        }
        else {
            userNameError.isHidden = true
        }
        checkFormValid()
    }
    
    @IBAction func userEmailChanged(_ sender: Any) {
        if (!isEmailValid(emailStr: userEmail.text ?? "")) {
            userEmailError.isHidden = false
        }
        else {
            userEmailError.isHidden = true
        }
        checkFormValid()
    }
    
    @IBAction func userConfirmEmailChanged(_ sender: Any) {
        if (userConfirmEmail.text != userEmail.text) {
            userConfirmEmailError.isHidden = false
        }
        else {
            userConfirmEmailError.isHidden = true
        }
        checkFormValid()
    }
    
    
    @IBAction func requestInviteAction(_ sender: Any) {
        requestMessage.isHidden = false
        
        requestMessage.text = saveToServer(userName: userName.text ?? "", userEmail: userEmail.text ?? "")
        
        if (requestMessage.text == "Registered") {
            performSegue(withIdentifier: "showCongratulationViewController", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? CongratulationsViewController {
            destination.userName = userName.text ?? ""
            destination.userEmail = userEmail.text ?? ""
        }
        //Code not being used
//        if let destination = segue.destination as? PreRequestViewController {
//            destination.userRegistered = true
//        }
    }
    
    @IBAction func dismissAction(_ sender: Any) {
        if (requestMessage.text == "Registered") {
            delegate?.isUserRegistered()
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    //Did not work
//    @IBAction func unwindToPreRequest(_ unwindSegue: UIStoryboardSegue) {
//        // Use data from the view controller which initiated the unwind segue
//    }
    
}
