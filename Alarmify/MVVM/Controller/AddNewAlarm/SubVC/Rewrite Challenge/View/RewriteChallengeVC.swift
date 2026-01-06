//
//  RewriteChallengeVC.swift
//  Alarmify
//
//  Created by iMac on 05/01/26.
//

import UIKit

class RewriteChallengeVC: UIViewController {

    @IBOutlet weak var bottomBgView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bottomBgView.layer.cornerRadius = 22
        bottomBgView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        // Do any additional setup after loading the view.
    }

    @IBAction func tappedBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func tappedSave(_ sender: Any) {
    }
    @IBAction func tappedPreview(_ sender: Any) {
    }
    

}
