//
//  RewriteChallengeVC.swift
//  Alarmify
//
//  Created by iMac on 05/01/26.
//

import UIKit

class RewriteChallengeVC: UIViewController {

    @IBOutlet weak var bottomBgView: UIView!
    @IBOutlet weak var keyTextField: UITextField!
    @IBOutlet weak var levelSlider: UISlider!
    @IBOutlet weak var challengeLabel: UILabel!
    
    enum Difficulty: Int {
        case easy = 0
        case medium = 1
        case hard = 2
    }
    
    var currentDifficulty: Difficulty = .easy
    var challengeText: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bottomBgView.layer.cornerRadius = 22
        bottomBgView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        setupUI()
        generateChallenge()
        // Do any additional setup after loading the view.
    }
    
    func setupUI() {
        levelSlider.minimumValue = 0
        levelSlider.maximumValue = 2
        levelSlider.isContinuous = true
    }
    
    // MARK: - Generate Challenge
    
    func generateChallenge() {
        challengeText = makeRandomText()
        challengeLabel.text = challengeText
        keyTextField.text = ""
        keyTextField.layer.borderWidth = 0
    }
    
    func makeRandomText() -> String {
        let alphabets = "AaBbCcDdEeFfGgHhIiJjKkLlMmNn"
        let numbers = "0123456789"
        let symbols = "!@#$%^&*()_+=-{}[]:\";'<>?,./\\|"
        
        var base = alphabets
        
        switch currentDifficulty {
        case .easy:
            base = alphabets
        case .medium:
            base = alphabets + numbers
        case .hard:
            base = alphabets + numbers + symbols
        }
        
        return String(base.shuffled())
    }

    @IBAction func tappedBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func tappedSave(_ sender: Any) {
    }
    @IBAction func tappedPreview(_ sender: Any) {
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        let steppedValue = round(sender.value)
        sender.value = steppedValue
        currentDifficulty = Difficulty(rawValue: Int(steppedValue)) ?? .hard
        generateChallenge()
    }
    
}
