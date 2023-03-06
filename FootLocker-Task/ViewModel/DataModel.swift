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
class Model {
    
    func fetchData() -> Observable<[Response]>{
        return Observable<[Response]>.create{ observer -> Disposable in
            if InternetConnectCheckClass.isConnectedToNetwork(){
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
            else {
                print("No network connection")
            }
            return Disposables.create {
                
            }
    }
    
}
}


class InternetConnectCheckClass {
    
    //MARK: Check Network Connectivity method
    class func isConnectedToNetwork() -> Bool {
        var zeroAddress = sockaddr_in(sin_len: 0, sin_family: 0, sin_port: 0, sin_addr: in_addr(s_addr: 0), sin_zero: (0, 0, 0, 0, 0, 0, 0, 0))
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        var flags: SCNetworkReachabilityFlags = SCNetworkReachabilityFlags(rawValue: 0)
        if SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) == false {
            return false
        }
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        let result = (isReachable && !needsConnection)
        
        return result
        
    }
}

