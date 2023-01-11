//
//  CongratulationsViewController.swift
//  BlinqCodeChallengev2
//
//  Created by Chrishane Amarasekara on 11/1/2023.
//

import UIKit

class CongratulationsViewController: UIViewController {
    
    @IBOutlet weak var ConfettiView: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let confettiGIF = UIImage.gifImageWithName("Confetti")
        ConfettiView.image = confettiGIF

        // Do any additional setup after loading the view.
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
