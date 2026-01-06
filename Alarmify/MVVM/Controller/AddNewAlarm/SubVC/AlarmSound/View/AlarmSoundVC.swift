//
//  AlarmSoundVC.swift
//  Alarmify
//
//  Created by Ankit on 06/01/26.
//

import UIKit

class AlarmSoundVC: UIViewController {

    @IBOutlet weak var soundListTableView: UITableView! {
        didSet {
            soundListTableView.register(SoundListTVCell.nib, forCellReuseIdentifier: SoundListTVCell.identifier)
            soundListTableView.delegate = self
            soundListTableView.dataSource = self
        }
    }
    
    var viewModel = AlarmSoundViewModel()
    
    // MARK: - view Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.soundList = viewModel.loadAlarmSounds()
        viewModel.successGetSound = {
            self.soundListTableView.reloadData()
        }

        // Do any additional setup after loading the view.
    }

    @IBAction func tappedBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func tappedCreate(_ sender: Any) {
    }
    

}

// MARK: - TV Delegate & DataSource
extension AlarmSoundVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.soundList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SoundListTVCell.identifier) as? SoundListTVCell else { return UITableViewCell() }
        
        let data = viewModel.soundList[indexPath.row]
        cell.ringNameLabel.text = data.name
        
        let selectIndex = viewModel.selectedIndex == indexPath.item
        cell.selectImageView.image = selectIndex ? UIImage(named: "ic_select_sound") : UIImage(named: "ic_unselect_sound")
        cell.playSoundImageView.isHidden = selectIndex ? false : true
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // SAME CELL TAPPED AGAIN → STOP
           if viewModel.selectedIndex == indexPath.row && SoundPlayer.shared.isPlaying() {
               SoundPlayer.shared.stop()
               viewModel.isPlaying = false
           }
           // NEW CELL → PLAY
           else {
               viewModel.selectedIndex = indexPath.row
               viewModel.isPlaying = true

               let sound = viewModel.soundList[indexPath.row]
               SoundPlayer.shared.playSound(named: sound.type)
           }

           tableView.reloadData()
    }
        
}
