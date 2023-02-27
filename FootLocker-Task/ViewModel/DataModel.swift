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

// API Calling
class Model {
    
    func fetchData() -> Observable<[Response]>{
        return Observable<[Response]>.create{ observer -> Disposable in
            let task = URLSession.shared.dataTask(with: URL(string: "https://gateway.marvel.com/v1/public/characters?ts=1676887446.483686&apikey=8584cbfe952a528f4c140c400d59a51a&hash=c289ac03b2d7f4c7334371b85b527136")!){
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
    }
    
}




