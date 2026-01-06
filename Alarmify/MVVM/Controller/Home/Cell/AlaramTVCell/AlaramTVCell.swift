//
//  AlaramTVCell.swift
//  Alarmify
//
//  Created by Ankit on 05/01/26.
//

import UIKit

class AlaramTVCell: UITableViewCell {

    @IBOutlet weak var liveView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var alaramTimeLabel: UILabel!
    @IBOutlet weak var moreButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupMoreMenu()
        // Initialization code
    }
    
    private func setupMoreMenu() {
        
        let previewAction = UIAction(
            title: "Preview Alarm",
            image: UIImage(named: "ic_preview")
        ) { _ in
            print("Preview tapped")
        }
        
        let deleteAction = UIAction(
            title: "Delete Alarm",
            image: UIImage(named: "ic_delete")
        ) { _ in
            print("Delete tapped")
        }
        
        moreButton.menu = UIMenu(children: [deleteAction, previewAction])
        moreButton.showsMenuAsPrimaryAction = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func tappedSwitch(_ sender: UISwitch) {
    }
    @IBAction func tappedScan(_ sender: Any) {
    }
    @IBAction func tappedDetails(_ sender: Any) {
    }
    @IBAction func tappedMore(_ sender: UIButton) {
        let interaction = UIContextMenuInteraction(delegate: self)
        sender.addInteraction(interaction)
    }
    
}

extension AlaramTVCell: UIContextMenuInteractionDelegate {

    func contextMenuInteraction(
        _ interaction: UIContextMenuInteraction,
        configurationForMenuAtLocation location: CGPoint
    ) -> UIContextMenuConfiguration? {

        return UIContextMenuConfiguration(
            identifier: nil,
            previewProvider: {
                return ViewController() // optional
            },
            actionProvider: { _ in

                let previewAction = UIAction(
                    title: "Preview Alarm",
                    image: UIImage(named: "ic_preview")
                ) { _ in
                    print("Preview tapped")
                }
                
                let deleteAction = UIAction(
                    title: "Delete Alarm",
                    image: UIImage(named: "ic_delete")
                ) { _ in
                    print("Delete tapped")
                }

                return UIMenu(children: [deleteAction, previewAction])
            }
        )
    }
}
