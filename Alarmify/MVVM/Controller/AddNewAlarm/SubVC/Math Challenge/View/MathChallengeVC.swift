//
//  MathChallengeVC.swift
//  Alarmify
//
//  Created by iMac on 05/01/26.
//

import UIKit

class MathChallengeVC: UIViewController {

    @IBOutlet weak var equationsTableView: UITableView!
    
    @IBOutlet weak var equationsSlider: UISlider!
    @IBOutlet weak var difficultySlider: UISlider!
    
    var equationsCount: Int = 4
    
    override func viewDidLoad() {
        super.viewDidLoad()

        equationsTableView.register(UINib(nibName: "MathEquationsTblViewCell", bundle: nil), forCellReuseIdentifier: "MathEquationsTblViewCell")
        equationsTableView.dataSource = self
        equationsTableView.delegate = self
        
        equationsSlider.minimumValue = 1
        equationsSlider.maximumValue = 10
        equationsSlider.value = Float(equationsCount)
        equationsSlider.isContinuous = true
        // Do any additional setup after loading the view.
    }

    @IBAction func tappedBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func tappedEqiations(_ sender: UISlider) {
        sender.value = round(sender.value)
        equationsCount = Int(sender.value)
        equationsTableView.reloadData()
    }
    @IBAction func tappedDifficulty(_ sender: UISlider) {
    }
    @IBAction func tappedSave(_ sender: Any) {
    }
    @IBAction func tappedPreview(_ sender: Any) {
    }
    
}

extension MathChallengeVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return equationsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.equationsTableView.dequeueReusableCell(withIdentifier: "MathEquationsTblViewCell") as! MathEquationsTblViewCell
        
        cell.numberLabel.text = "\(indexPath.row + 1)."
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 54
    }
    
}
