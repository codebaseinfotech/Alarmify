//
//  HomeVC.swift
//  Alarmify
//
//  Created by Ankit on 05/01/26.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var playAlarmsLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var listTableView: UITableView! {
        didSet {
            listTableView.register(AlaramTVCell.nib, forCellReuseIdentifier: "AlaramTVCell")
            listTableView.delegate = self
            listTableView.dataSource = self
            
            listTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 70, right: 0)
        }
    }
    
    // MARK: - view Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    // MARK: - Action Method
    @IBAction func tappedCreate(_ sender: Any) {
        let vc = AddNewAlarmVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
     

}

// MARK: - TV Delegate & DataSource
extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AlaramTVCell") as? AlaramTVCell else { return UITableViewCell() }
        
        return cell
    }
    
    
}
