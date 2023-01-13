//
//  SuccessfulCancelViewController.swift
//  BlinqCodeChallengev2
//
//  Created by Chrishane Amarasekara on 13/1/2023.
//

import UIKit

class SuccessfulCancelViewController: UIViewController {

    @IBOutlet weak var RainView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rainGIF = UIImage.gifImageWithName("Rain")
        RainView.image = rainGIF

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
