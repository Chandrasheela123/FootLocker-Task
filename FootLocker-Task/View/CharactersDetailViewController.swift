//
//  CharactersDetail.swift
//  FootLocker-Task
//
//  Created by Chandrasheela Hotkar on 27/02/23.
//

import UIKit
import Kingfisher

class CharactersDetailViewController: UIViewController {

    
    let MarvelModel = Model()
    
    @IBOutlet weak var characterDescription: UITextView!
    @IBOutlet weak var charactersImage: UIImageView!
    @IBOutlet weak var characterName: UILabel!
    @IBOutlet weak var comicLabel: UILabel!
    @IBOutlet weak var eventLabel: UILabel!
    @IBOutlet weak var storiesLabel: UILabel!
    @IBOutlet weak var seriesLabel: UILabel!
    
    
    var strName = ""
    var strDescription = ""
    var strComic = ""
    var strevent = ""
    var strStories = ""
    var strSeries = ""
    var strImage : UIImage?
    
    var characterImage = Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        characterName.text = strName
        characterDescription.text = strDescription
        comicLabel.text = strComic
        eventLabel.text = strevent
        storiesLabel.text = strStories
        seriesLabel.text = strSeries
        charactersImage.image = strImage
        
        

        // Do any additional setup after loading the view.
    }
    

    @IBAction func SeriesButtonClick(_ sender: Any) {
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
