//
//  AddNewAlarmVC.swift
//  Alarmify
//
//  Created by Ankit on 05/01/26.
//

import UIKit

class AddNewAlarmVC: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker! {
        didSet {
            datePicker.preferredDatePickerStyle = .wheels
            datePicker.overrideUserInterfaceStyle = .dark

        }
    }
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var dayCollectionView: UICollectionView! {
        didSet {
            dayCollectionView.register(DayCVCell.nib, forCellWithReuseIdentifier: DayCVCell.identifier)
            dayCollectionView.delegate = self
            dayCollectionView.dataSource = self
        }
    }
    @IBOutlet weak var viewBottom: UIView!
    
    @IBOutlet weak var soundNameLabel: UILabel!
    @IBOutlet weak var volumeSlider: UISlider!
    @IBOutlet weak var vibrationSwitch: UISwitch!
    @IBOutlet weak var gentleLabel: UILabel!
    @IBOutlet weak var snoozeLabel: UILabel!
    
    var viewModel = AddNewViewModel()
    
    // MARK: - view Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func tappedClose(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func tappedSave(_ sender: Any) {
    }
    @IBAction func tappedPreview(_ sender: Any) {
    }
    
    @IBAction func tappedSound(_ sender: Any) {
        let vc = AlarmSoundVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func tappedVolume(_ sender: UISlider) {
        print("user Volume", sender.value)
    }
    @IBAction func tappedVibration(_ sender: UISwitch) {
    }
    @IBAction func tappedGentleWakeUp(_ sender: Any) {
    }
    @IBAction func tappedSnooze(_ sender: Any) {
        let vc = SnoozeVC()
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
    @IBAction func tappedMath(_ sender: Any) {
        let vc = MathChallengeVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func tappedRewrite(_ sender: Any) {
        let vc = RewriteChallengeVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func tappedBarCode(_ sender: Any) {
        let vc = BarcodeChallengeVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func tappedShake(_ sender: Any) {
        let vc = ShakeChallengeVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

// MARK: - CV Delegate & DataSource
extension AddNewAlarmVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.dayListArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DayCVCell.identifier, for: indexPath) as? DayCVCell else { return UICollectionViewCell() }
        
        let dicData = viewModel.dayListArray[indexPath.item]
        
        cell.nameLabel.text = dicData
        
        return cell
    }
    
}

// MARK: - CV DelegateFlowlayout
extension AddNewAlarmVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 42, height: 45)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
    
}
