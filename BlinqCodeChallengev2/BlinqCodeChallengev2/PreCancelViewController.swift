//
//  PreCancelViewController.swift
//  BlinqCodeChallengev2
//
//  Created by Chrishane Amarasekara on 13/1/2023.
//

import UIKit

class PreCancelViewController: UIViewController {

    var cancelInvite = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func openSuccessfulCancelViewController(_ sender: Any) {
        let alert = UIAlertController(title: "Are you sure you would like to cancel your invite", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("Yes", comment: "Cancel Invite"), style: .default, handler: { _ in
            NSLog("The \"cancel invite\" alert occured.")
            self.cancelInvite = true
            if (self.cancelInvite) {
                self.performSegue(withIdentifier: "showSuccessfulCancelViewController", sender: self)
            }
            }))
        alert.addAction(UIAlertAction(title: NSLocalizedString("No, I changed my mind", comment: "Do not cancel invite"), style: .default, handler: { _ in
        NSLog("The \"cancel invite\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
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
