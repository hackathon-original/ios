//
//  TotalViewController.swift
//  RewardsBitCoin
//
//  Created by Eduardo Paganini on 12/3/17.
//  Copyright © 2017 Eduardo Paganini. All rights reserved.
//

import Foundation
import UIKit


public class TotalViewController:UITableViewController {
    @IBOutlet weak var outletDebitoConta: UILabel!
    
    @IBOutlet weak var outletCashBack: UILabel!
    
    @IBOutlet weak var outletTotal: UILabel!
    
    var debitoConta:Float?
    var cashBack:Float?
    var total:Float?
    
    public override func viewDidLoad() {
        
        let valorString = "R$ \(String(format: "%.2f", total!))"
        
        outletTotal.text = "R$ \(String(format: "%.2f", total!))"
        outletCashBack.text = "R$ \(String(format: "%.2f", cashBack!))"
        outletDebitoConta.text = "R$ \(String(format: "%.2f", debitoConta!))"
    
    
    
    
    
    
    
    
    
    
    
    
    
    }
}
