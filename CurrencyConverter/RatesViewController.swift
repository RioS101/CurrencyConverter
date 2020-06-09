//
//  RatesViewController.swift
//  CurrencyConverter
//
//  Created by Riad on 5/31/20.
//  Copyright © 2020 Projectum. All rights reserved.
//

import UIKit
// MARK: CollectionView
extension RatesViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    // MARK: UICollectionView data source
    
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
    
    // MARK: UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let totalWidth = collectionView.bounds.size.width
        let numberOfCellPerRow = 2
        let sizeForCell = CGFloat(Int(totalWidth) / numberOfCellPerRow)
        
        return CGSize(width: sizeForCell, height: sizeForCell)
    }

}

// MARK: ViewController
class RatesViewController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    @IBOutlet var baseCurrencyTitle: UILabel!
    
    // MARK: Pull to refresh
    //closure that is assigned to refreshControl property of collectionView
    let refreshRates: UIRefreshControl = {
       let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh(sender:)), for: .valueChanged)
        return refreshControl
    }()
    
    //action method itself thats passed to #selector
    @objc private func refresh(sender: UIRefreshControl) {
        Currency.fetchRates(query: ["base" : baseCurrency]) { (rates) in
            guard let ratesContainerType = rates else {return}
            
            DispatchQueue.main.async {
                //remove old data before populating a new one
                self.currenciesWithRates.removeAll()
                
                for item in self.currencyTitles {
                    self.currenciesWithRates.append(Currency(title: item, isChecked: false, rate: ratesContainerType.rates[item]))
                    //remove base currency from list of rates (because its value is not informative (1.0)
                    self.currenciesWithRates.removeAll { (currency) -> Bool in
                        currency.title == self.baseCurrency
                    }
                }
            }
            
        }
        sender.endRefreshing()
        collectionView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.refreshControl = refreshRates
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // UICollectionViewFlowLayout
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = 10
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
        
        // MARK: Network request
        //In this scenario API doesn't return all the required information but only a piece of it...
        Currency.fetchRates(query: ["base" : baseCurrency]) { (rates) in
            guard let ratesContainerType = rates else {return}
            //why don't we need DispathQueue.main.async here?
            for item in self.currencyTitles {
                self.currenciesWithRates.append(Currency(title: item, isChecked: false, rate: ratesContainerType.rates[item]))
                //remove base currency from list of rates (because its value is not informative (1.0)
                self.currenciesWithRates.removeAll { (currency) -> Bool in
                    currency.title == self.baseCurrency
                }
            }
            DispatchQueue.main.async {
                self.collectionView.reloadData()
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
