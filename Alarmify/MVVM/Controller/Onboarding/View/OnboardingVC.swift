//
//  OnboardingVC.swift
//  Alarmify
//
//  Created by Ankit on 05/01/26.
//

import UIKit

class OnboardingVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func tappedContinue(_ sender: Any) {
        let vc = HomeVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
     

}
