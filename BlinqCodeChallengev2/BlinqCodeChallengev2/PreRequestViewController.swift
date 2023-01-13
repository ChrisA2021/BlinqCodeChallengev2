//
//  PreRequestViewController.swift
//  BlinqCodeChallengev2
//
//  Created by Chrishane Amarasekara on 11/1/2023.
//

import UIKit

class PreRequestViewController: UIViewController, RequestFormDelegate {
    
    @IBOutlet weak var userPrompt: UILabel!
    var userRegistered = false

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func isUserRegistered() {
        userRegistered = true
        if (userRegistered) {
            performSegue(withIdentifier: "showPreCancelViewController", sender: self)
        }
    }
    
    
    @IBAction func openFormAction(_ sender: Any) {
        
        //Delegate functionality not working
        
//        let destinationVC = RequestFormViewController()
//        destinationVC.delegate = self
//        destinationVC.modalPresentationStyle = .pageSheet
//        destinationVC.sheetPresentationController?.detents = [.large()]
//        destinationVC.sheetPresentationController?.prefersGrabberVisible = true
//        present(destinationVC, animated: true)
        
        performSegue(withIdentifier: "showRequestFormViewController", sender: self)
    }
    
    @IBAction func openPreCancelView(_ sender: Any) {
        print(userRegistered)
        performSegue(withIdentifier: "showPreCancelViewController", sender: self)
    }
    
    
}

