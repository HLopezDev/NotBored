//
//  ActivityTableViewCell.swift
//  NotBored
//
//  Created by Sofia Belen Delgado Gonzalez on 21/3/22.
//

import UIKit

class ActivityTableViewCell: UITableViewCell {

    @IBOutlet weak var typeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
//    func update(activity: Activity){
//        typeLabel.text = activity.type
//    }
}
