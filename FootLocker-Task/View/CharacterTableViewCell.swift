//
//  ViewControllerCell.swift
//  FootLocker-Task
//
//  Created by Chandrasheela Hotkar on 21/02/23.
//

import UIKit
import RxSwift
import RxCocoa
import Kingfisher

class CharacterTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cellBackgroundView: UIView!
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var nameBackgroundView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        SetCornerRadius().cornerRadius(view: cellBackgroundView)
//        SetCornerRadius().cornerRadius(view: nameBackgroundView)
        // Initialization code
    }
   
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}



    
   

