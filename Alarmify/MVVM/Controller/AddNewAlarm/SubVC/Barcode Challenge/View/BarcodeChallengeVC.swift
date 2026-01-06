//
//  BarcodeChallengeVC.swift
//  Alarmify
//
//  Created by iMac on 06/01/26.
//

import UIKit

class BarcodeChallengeVC: UIViewController {

    @IBOutlet weak var barcodeListTableView: UITableView!
    @IBOutlet weak var scanOrderSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        barcodeListTableView.register(UINib(nibName: "BarcodeListTblViewCell", bundle: nil), forCellReuseIdentifier: "BarcodeListTblViewCell")
        barcodeListTableView.dataSource = self
        barcodeListTableView.delegate = self
        // Do any additional setup after loading the view.
    }

    @IBAction func tappedBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func tappedSacnOrder(_ sender: Any) {
    }
    @IBAction func tappedAddBarcode(_ sender: Any) {
    }
    @IBAction func tappedSave(_ sender: Any) {
    }
    @IBAction func tappedPreview(_ sender: Any) {
    }
    
}

extension BarcodeChallengeVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.barcodeListTableView.dequeueReusableCell(withIdentifier: "BarcodeListTblViewCell") as! BarcodeListTblViewCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 58
    }
    
}
