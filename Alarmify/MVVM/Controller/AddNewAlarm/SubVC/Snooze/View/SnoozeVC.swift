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
                closeButton.configuration = .clearGlass()
            } else {
                // Fallback on earlier versions
            }
        }
    }
    
    @IBOutlet weak var intervelLabel: UILabel!
    @IBOutlet weak var maxSnoozeLabel: UILabel!
    
    // intervel
    @IBOutlet weak var oneMinIV: UIImageView! {
        didSet {
            oneMinIV.image = "ic_select_sound".image
        }
    }
    @IBOutlet weak var ThreeMinIV: UIImageView!
    @IBOutlet weak var FiveMinIV: UIImageView!
    
    // max Snooze
    @IBOutlet weak var oneTimeIV: UIImageView! {
        didSet {
            oneTimeIV.image = "ic_select_sound".image
        }
    }
    @IBOutlet weak var TwoTimeIV: UIImageView!
    @IBOutlet weak var threeTimeIV: UIImageView!
    
    // MARK: - view Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func tappedClose(_ sender: Any) {
        self.dismiss(animated: false)
    }
    
    // Intervel
    @IBAction func tappedOneMin(_ sender: Any) {
        oneMinIV.image = "ic_select_sound".image
        ThreeMinIV.image = "ic_unselect_sound".image
        FiveMinIV.image = "ic_unselect_sound".image
        
        intervelLabel.text = "1 min"
    }
    @IBAction func tappedThreeMin(_ sender: Any) {
        ThreeMinIV.image = "ic_select_sound".image
        oneMinIV.image = "ic_unselect_sound".image
        FiveMinIV.image = "ic_unselect_sound".image
        
        intervelLabel.text = "3 min"
    }
    @IBAction func tappedFiveMin(_ sender: Any) {
        FiveMinIV.image = "ic_select_sound".image
        ThreeMinIV.image = "ic_unselect_sound".image
        oneMinIV.image = "ic_unselect_sound".image
        
        intervelLabel.text = "5 min"
    }
    
    // Max Snoozes
    @IBAction func tappedOneTime(_ sender: Any) {
        oneTimeIV.image = "ic_select_sound".image
        TwoTimeIV.image = "ic_unselect_sound".image
        threeTimeIV.image = "ic_unselect_sound".image
        
        maxSnoozeLabel.text = "1 time"
    }
    @IBAction func tappedTwoTime(_ sender: Any) {
        TwoTimeIV.image = "ic_select_sound".image
        oneTimeIV.image = "ic_unselect_sound".image
        threeTimeIV.image = "ic_unselect_sound".image
        
        maxSnoozeLabel.text = "2 times"
    }
    @IBAction func tappedThreeTime(_ sender: Any) {
        threeTimeIV.image = "ic_select_sound".image
        oneTimeIV.image = "ic_unselect_sound".image
        TwoTimeIV.image = "ic_unselect_sound".image
        
        maxSnoozeLabel.text = "3 times"
    }
    
    
}
