//
//  CollectionViewController.swift
//  RewardsBitCoin
//
//  Created by Eduardo Paganini on 12/2/17.
//  Copyright © 2017 Eduardo Paganini. All rights reserved.
//

import Foundation
import UIKit


class CollectionViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    @IBOutlet weak var outletRewards: UILabel!
    var rewards:Float?
    
    var balance:Float?
    
    @IBOutlet weak var outletbalanceSlide: UISlider!
    
    @IBOutlet weak var outletrewardsSlide: UISlider!
    @IBOutlet weak var outletBalance: UILabel!
    
    @IBOutlet weak var outletTrocarButton: UIButton!
    var total:Float = 0
    let indicator = UIActivityIndicatorView()
    override func viewDidLoad() {
        outletRewards.addSubview(indicator)
        indicator.startAnimating()
        showTotal()
//        OpenApiService.sharedInstance.getRewards(completion: { (modelo) in
//            self.rewards = modelo.current_balance
//            let valor = String(format: "%.2f", self.rewards!)
//            self.outletRewards.text = "R$ \(valor)"
//            self.outletrewardsSlide.maximumValue = self.rewards!
//            self.indicator.stopAnimating()
//        }) { (errorCode, errorDescription) in
//             self.indicator.stopAnimating()
//            self.showTotal()
//            //TODO
//        }
//        self.balance = 25
        
        self.rewards = 25
        let valor = String(format: "%.2f", self.rewards!)
        self.outletRewards.text = "R$ \(valor)"
        self.outletrewardsSlide.maximumValue = self.rewards!
        self.indicator.stopAnimating()
        self.showTotal()
        
        OpenApiService.sharedInstance.getBalance(completion: { (modelo) in
            self.balance = modelo.balanceValue()

            let valor = String(format: "%.2f", self.balance!)
            self.outletBalance.text = "R$ \(valor)"
            self.outletbalanceSlide.maximumValue = self.balance!
            self.indicator.stopAnimating()
            self.showTotal()

        }) { (errorCode, errorDescription) in
            self.indicator.stopAnimating()
            //TODO
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
             let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellMain", for: indexPath) as! CellMain
        let x = "img\(indexPath.row + 1).png"
        
        cell.outletImage.image = UIImage(named:x)
        return cell

    }
    @IBAction func balanceValueChanged(_ sender: Any) {
        showTotal()
    }
    
    @IBAction func rewardsValueChanged(_ sender: Any) {
        showTotal()
    }
    func showTotal() {
        total = Float(outletbalanceSlide.value + outletrewardsSlide.value)
        let valorString = "Troque por Bitcoins:R$ \(String(format: "%.2f", total))"
        self.outletTrocarButton.setTitle(valorString, for: .normal)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "segueComprar") {
            let v = segue.destination as! TotalViewController
            v.total = total
            v.cashBack = Float(self.outletrewardsSlide.value)
            v.debitoConta = Float(self.outletbalanceSlide.value)
        }

    }
    
    
    
}
