//
//  Modelo.swift
//  RewardsBitCoin
//
//  Created by Eduardo Paganini on 12/2/17.
//  Copyright © 2017 Eduardo Paganini. All rights reserved.
//

import Foundation

import ObjectMapper

class Rewards: Mappable {
    var current_balance: Float?
    
    required init?(map: Map){
        
    }
    func mapping(map: Map) {
        current_balance <- map["current_balance"]
    }
}
