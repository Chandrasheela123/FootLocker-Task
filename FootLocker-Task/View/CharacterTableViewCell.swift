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
    @IBOutlet weak var characterImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }
   
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}



    
   

