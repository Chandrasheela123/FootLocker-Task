//
//  DataModel.swift
//  FootLocker-Task
//
//  Created by Chandrasheela Hotkar on 22/02/23.
//

import Foundation
import RxSwift
import RxCocoa
import Kingfisher
import SwiftUI
import SystemConfiguration

// API Calling

class HomeViewModel {
    
    static let homeViewInstance = HomeViewModel()
    
    func fetchData() -> Observable<[Response]>{
        return Observable<[Response]>.create{ observer -> Disposable in
            if InternetConnectCheckClass.networkInstance.isConnectedToNetwork(){
                
                let urlString = AppUrl.Domains.domain!
                
            let task = URLSession.shared.dataTask(with: urlString){
                data, _, _ in
                guard let data = data else{
                    observer.onError(NSError(domain: "", code: -1, userInfo: nil))
                    print("bad url")
                    return
                }
                print("Good URL")
                do{
                    let jsonData = try JSONDecoder().decode(MarvelData.self, from: data)
                    observer.onNext(jsonData.data.results)
                    observer.onCompleted()
                    
                }catch{
                    observer.onError(error)
                }
            }
            task.resume()
            return Disposables.create{
                task.cancel()
                
            }
        }
            else {
                
                print("No network connection")
            }
            return Disposables.create {
                
            }
    }
    
}
}


