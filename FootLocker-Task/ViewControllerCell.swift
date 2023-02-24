//
//  ViewControllerCell.swift
//  FootLocker-Task
//
//  Created by Chandrasheela Hotkar on 21/02/23.
//

import UIKit
import RxSwift
import RxCocoa

class ViewControllerCell: UITableViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label1: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
