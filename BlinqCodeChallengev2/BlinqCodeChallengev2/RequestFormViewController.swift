//
//  RequestFormViewController.swift
//  BlinqCodeChallengev2
//
//  Created by Chrishane Amarasekara on 11/1/2023.
//

import UIKit

class RequestFormViewController: UIViewController {
    
    @IBOutlet weak var userName: UITextField!
    
    @IBOutlet weak var userEmail: UITextField!
    
    @IBOutlet weak var userConfirmEmail: UITextField!
    
    
    @IBOutlet weak var userNameError: UILabel!
    
    @IBOutlet weak var userEmailError: UILabel!
    
    @IBOutlet weak var userConfirmEmailError: UILabel!
    
    @IBOutlet weak var requestInviteButton: UIButton!
    
    @IBOutlet weak var requestMessage: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetForm()

        // Do any additional setup after loading the view.
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
            self.performSegue(withIdentifier: "CongratulationsViewController", sender: nil)
        }
//        resetForm()
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
