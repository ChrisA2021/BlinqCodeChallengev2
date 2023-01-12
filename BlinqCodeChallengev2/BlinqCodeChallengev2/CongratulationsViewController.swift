//
//  CongratulationsViewController.swift
//  BlinqCodeChallengev2
//
//  Created by Chrishane Amarasekara on 11/1/2023.
//

import UIKit

class CongratulationsViewController: UIViewController {
    
    @IBOutlet weak var congratulationsMessage: UILabel!
    @IBOutlet weak var ConfettiView: UIImageView!
    
    @IBOutlet weak var congratulationsBroccoli: UIImageView!
    
    var userName = ""
    var userEmail = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let confettiGIF = UIImage.gifImageWithName("Confetti")
        ConfettiView.image = confettiGIF
        

        congratulationsMessage.text = "Congratulations \(userName)!\n Your invite has been sent to \n \(userEmail)"
    }
    
    @IBAction func dismissAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
