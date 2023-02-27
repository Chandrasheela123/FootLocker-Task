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
            (row, album, cell) in
            let urlString = URL(string: (album.thumbnail.path + "." + (album.thumbnail.thumbnailExtension ?? "")))
            cell.nameLabel.text = album.name
          //  cell.descriptionTextView.text = album.description
            cell.characterImage.kf.setImage(with: urlString)
            
       // }
        tableView.rx.itemSelected.subscribe(onNext: { [weak self] _ in
            guard let strongSelf = self else {return}
            guard let characterDetailVC = strongSelf.storyboard?.instantiateViewController(withIdentifier: "characterDetails") as? CharactersDetailViewController else {
                
                fatalError("task controller not found")
            }
            strongSelf.navigationController?.pushViewController(characterDetailVC, animated: true)
            
            characterDetailVC.strName = album.name
            characterDetailVC.strDescription = album.description
            characterDetailVC.strComic = "\(album.comics.available)"
            characterDetailVC.strevent = "\(album.events.available)"
            characterDetailVC.strSeries = "\(album.series.available)"
            characterDetailVC.strStories = "\(album.stories.available)"
//
//            let characterImage = cell.characterImage.kf.setImage(with: urlString)
//            characterDetailVC.strImage = characterImage as? UIImage
        })
    }
        
        }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(ts)
        
        // call function to display data in tableview
        databinding()
      MarvelModel.fetchData().subscribe(onNext: { dat in

          print(dat)
        } )
        // Do any additional setup after loading the view.
    }
}
