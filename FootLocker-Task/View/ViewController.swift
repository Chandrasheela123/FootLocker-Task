//
//  ViewController.swift
//  FootLocker-Task
//
//  Created by Chandrasheela Hotkar on 20/02/23.
//

import UIKit
import RxCocoa
import RxSwift
import Kingfisher
import CommonCrypto
import CryptoKit
import simd


class ViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    let MarvelModel = Model()
    private var bag = DisposeBag()
    
    
    
    let publickey = "8584cbfe952a528f4c140c400d59a51a"
    let privatekey = "8c0e6985593d2d456d115f8ce975353f5a3ad235"
    let ts = NSDate().timeIntervalSince1970.description
    
 //Function to display data in tableview
    func databinding(){
        MarvelModel.fetchData().bind(to: tableView.rx.items(cellIdentifier: "cell", cellType: CharacterTableViewCell.self)){ [self]
            (_, album, cell) in
            let urlString = URL(string: (album.thumbnail.path + "." + (album.thumbnail.thumbnailExtension ?? "")))
            cell.nameLabel.text = album.name
            cell.characterImage.kf.setImage(with: urlString)
            
            
        }

        tableView.rx.modelSelected(Response?.self).subscribe(onNext: { characterDetailItem in
            print("You selected:", characterDetailItem!.name)
            
            guard let characterDetailVC = self.storyboard?.instantiateViewController(withIdentifier: "characterDetails") as? CharactersDetailViewController else {
                fatalError("task controller not found")
            }
            
            self.navigationController?.pushViewController(characterDetailVC, animated: true)
            
            characterDetailVC.strName = characterDetailItem?.name ?? ""
            characterDetailVC.strDescription = characterDetailItem?.description ?? ""
            characterDetailVC.strComic = "\(characterDetailItem!.comics.available)"
            characterDetailVC.strevent = "\(characterDetailItem!.events.available)"
            characterDetailVC.strSeries = "\(characterDetailItem!.series.available)"
            characterDetailVC.strStories = "\(characterDetailItem!.stories.available)"
            
//            let imageURLString = URL(string: (characterDetailItem?.thumbnail.path ?? "" + "." + (characterDetailItem?.thumbnail.thumbnailExtension ?? "")))
//         
//            characterDetailVC.strImage = ImageDownloader(name: imageURLString)
            
           
            
        })
}
    override func viewDidLoad() {
        super.viewDidLoad()
        print(ts)
        
        // call function to display data in tableview
        databinding()
       
        // Do any additional setup after loading the view.
    }
}
