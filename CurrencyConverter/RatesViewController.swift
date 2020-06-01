//
//  RatesViewController.swift
//  CurrencyConverter
//
//  Created by Riad on 5/31/20.
//  Copyright © 2020 Projectum. All rights reserved.
//

import UIKit
//basic setup for CollecitonView in ViewController
//needs layout (flow) implementation if needed
extension RatesViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    //needs actual data from web server...
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
}

class RatesViewController: UIViewController {
    
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var baseCurrencyTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        collectionView.delegate = self
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
