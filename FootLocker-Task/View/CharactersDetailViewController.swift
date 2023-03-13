//
//  CharactersDetail.swift
//  FootLocker-Task
//
//  Created by Chandrasheela Hotkar on 27/02/23.
//

import UIKit
import Kingfisher
import RxCocoa
import RxSwift

class CharactersDetailViewController: UIViewController {
    
    @IBOutlet weak var imageBackgroundView: UIView!
    @IBOutlet weak var characterDescription: UITextView!
    @IBOutlet weak var charactersImage: UIImageView!
    @IBOutlet weak var characterName: UILabel!
    @IBOutlet weak var comicLabel: UILabel!
    @IBOutlet weak var eventLabel: UILabel!
    @IBOutlet weak var storiesLabel: UILabel!
    @IBOutlet weak var seriesLabel: UILabel!
    
    var strImage = ""
    var charData : Response?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      //  SetCornerRadius().cornerRadius(view: imageBackgroundView)
        characterName.text = charData?.name
        characterDescription.text = charData?.description
        comicLabel.text = "\(charData?.comics.available ?? 0)"
        eventLabel.text = "\(charData?.events.available ?? 0)"
        storiesLabel.text = "\(charData?.stories.available ?? 0)"
        seriesLabel.text = "\(charData?.series.available ?? 0)"
        
        let urlString = URL(string : strImage)
        charactersImage.kf.setImage(with: urlString)

        // Do any additional setup after loading the view.
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
