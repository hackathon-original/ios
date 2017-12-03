//
//  OpenApiService.swift
//  RewardsBitCoin
//
//  Created by Eduardo Paganini on 12/2/17.
//  Copyright © 2017 Eduardo Paganini. All rights reserved.
//

import Foundation
//
//  NotificacoesManager.swift
//  GRA
//
//  Created by Eduardo Paganini on 10/24/17.
//  Copyright © 2017 Eduardo Paganini. All rights reserved.
//

import Foundation

import AlamofireObjectMapper
import Alamofire
import ObjectMapper


class OpenApiService {
    static let sharedInstance = OpenApiService()
    private var manager: SessionManager
    let apiBaseUrl = "https://hackathon-btc.now.sh"

    private init() {
        self.manager = Alamofire.SessionManager.default
    }

    func getRewards(
        completion:@escaping (Rewards) -> Void,
        failure:@escaping (Int, String) -> Void) -> Void {
         let url: String =  apiBaseUrl + "/rewards"
        self.manager =  Alamofire.SessionManager.default
        
        Alamofire.request(url).validate(statusCode: 200..<305).responseObject { (response:DataResponse<Rewards>) in
            switch response.result {
            case .success:
                let model = response.result.value
                completion(model!)
            case .failure(let error):
                failure(0,"Error \(error)")
            }
        }
    }
    func getBalance(
        completion:@escaping (BalanceModel) -> Void,
        failure:@escaping (Int, String) -> Void) -> Void {
        let url: String =  apiBaseUrl + "/balance"
        self.manager =  Alamofire.SessionManager.default
        
        Alamofire.request(url).validate(statusCode: 200..<305).responseObject { (response:DataResponse<BalanceModel>) in
            switch response.result {
            case .success:
                let model = response.result.value
                completion(model!)
            case .failure(let error):
                failure(0,"Error \(error)")
            }
        }
    }
    
//
//    func getArray(
//        completion:@escaping (Array<Modelo>) -> Void,
//        failure:@escaping (Int, String) -> Void) -> Void {
//
//        let url: String =  apiBaseUrl + "/teste"
//        self.manager =  Alamofire.SessionManager.default
//        Alamofire.request(url).validate(statusCode: 200..<305).responseJSON { response in
//            switch response.result {
//            case .success:
//                //to get JSON return value
//                guard let responseJSON = response.result.value as? Array<[String: AnyObject]> else {
//                    failure(0,"Error reading response")
//                    return
//                }
//
//                guard let notifications:[Modelo] =                  Mapper<Modelo>().mapArray(JSONArray: responseJSON)
//                    else {
//                        failure(0,"Error mapping response")
//                        return
//                }
//
//                completion(notifications)
//            case .failure(let error):
//                failure(0,"Error \(error)")
//            }
//        }
//    }
    
    
    
    
}
