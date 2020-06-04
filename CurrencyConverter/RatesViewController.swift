//
//  RatesViewController.swift
//  CurrencyConverter
//
//  Created by Riad on 5/31/20.
//  Copyright © 2020 Projectum. All rights reserved.
//

import UIKit
//needs layout (flow) implementation if needed
extension RatesViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        currenciesWithRates.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ratesCell", for: indexPath) as! CollectionViewCell
        let item = currenciesWithRates[indexPath.row]
        
        cell.currencyTitle.text = item.title
        if let rate = item.rate {
            cell.currencyRate.text = String(rate)
        }
        
        return cell
    }

}

class RatesViewController: UIViewController {
    
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var baseCurrencyTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        Currency.fetchRates(query: ["base" : baseCurrency]) { (rates) in
            guard let ratesContainerType = rates else {return}
            
            for item in self.currencyTitles {
                self.currenciesWithRates.append(Currency(title: item, isChecked: false, rate: ratesContainerType.rates[item]))
            }
        }
        
        baseCurrencyTitle.text = baseCurrency
    }
    
    var baseCurrency: String = ""
    var currenciesWithRates: [Currency] = []
    var currencyTitles: [String] = ["EUR", "USD", "GBP", "RUB", "HKD", "IDR", "ILS", "DKK", "INR", "CHF", "MXN", "SZK", "SGB", "THB", "HRK", "MYR", "NOK", "CNY", "BGN", "PHP", "SEK", "PLN", "ZAR", "CAD", "ISK", "BRL", "RON", "NZD", "TRY", "JPY", "KRW", "HUF", "AUD"]
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
