//
//  Utils.swift
//  FootLocker-Task
//
//  Created by Chandrasheela Hotkar on 10/03/23.
//

import Foundation
import UIKit

struct AppUrl {
    
        struct Domains {
            
            static let domainName = "https://gateway.marvel.com/v1/public/characters?"
            static let ts = "1676887446.483686"
            static let apiKey = "8584cbfe952a528f4c140c400d59a51a"
            static let hashValue = "c289ac03b2d7f4c7334371b85b527136"

            static let urlString = Domains.domainName + "ts=" + Domains.ts + "&apikey=" + Domains.apiKey + "&hash=" + Domains.hashValue
            
            static let domain = URL(string: urlString)
            
            
            
            
//            static let domain = URL(string: "https://gateway.marvel.com/v1/public/characters?ts=1676887446.483686&apikey=8584cbfe952a528f4c140c400d59a51a&hash=c289ac03b2d7f4c7334371b85b527136")
            
            
            
        }
    }
