//
//  PreRequestViewController.swift
//  BlinqCodeChallengev2
//
//  Created by Chrishane Amarasekara on 11/1/2023.
//

import UIKit

class PreRequestViewController: UIViewController, RequestFormDelegate {
    
    var userRegistered = false

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func isUserRegistered(registered: Bool) {
        userRegistered = registered
        if (userRegistered) {
            performSegue(withIdentifier: "showPreCancelViewController", sender: self)
        }
    }
    
    
    @IBAction func openFormAction(_ sender: Any) {
        let destinationVC = RequestFormViewController()
        destinationVC.delegate = self
        
        performSegue(withIdentifier: "showRequestFormViewController", sender: nil)
    }
    
    @IBAction func openPreCancelView(_ sender: Any) {
        performSegue(withIdentifier: "showPreCancelViewController", sender: self)
    }
    
    
}

