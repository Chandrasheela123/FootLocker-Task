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


class ViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    let MarvelModel = Model()
    private var bag = DisposeBag()
    
    let publickey = "8584cbfe952a528f4c140c400d59a51a"
    let privatekey = "8c0e6985593d2d456d115f8ce975353f5a3ad235"
    let ts = NSDate().timeIntervalSince1970.description
    
 //Function to display data in tableview
    func databinding(){
        
        MarvelModel.bind(to: tableView.rx.items(cellIdentifier: "cell", cellType: ViewControllerCell.self)){
            (row, album, cell) in
            cell.label1.text = album.data.results[0].name
            cell.label2.text = album.data.results[0].description
        }.dispose()
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
