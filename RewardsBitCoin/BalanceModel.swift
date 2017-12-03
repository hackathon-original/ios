//
//  BalanceModel.swift
//  RewardsBitCoin
//
//  Created by Eduardo Paganini on 12/2/17.
//  Copyright © 2017 Eduardo Paganini. All rights reserved.
//

import Foundation
import ObjectMapper

class BalanceModel:Mappable{
    var current_balance: String?
    var available_limit: Float?
    var current_limit: Float?
    
    func balanceValue () -> Float{
        return (current_balance as! NSString).floatValue
    }
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        current_balance <- map["current_balance"]
        available_limit <- map["available_limit"]
        current_limit <- map["current_limit"]
    }
}
