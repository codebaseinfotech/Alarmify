//
//  SnoozeVC.swift
//  Alarmify
//
//  Created by Ankit on 06/01/26.
//

import UIKit

class SnoozeVC: UIViewController {

    @IBOutlet weak var closeButton: UIButton! {
        didSet {
            if #available(iOS 26.0, *) {
                closeButton.configuration = .glass()
            } else {
                // Fallback on earlier versions
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


  
}
