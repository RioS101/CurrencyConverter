//
//  CurrencyModel.swift
//  CurrencyConverter
//
//  Created by Riad on 5/28/20.
//  Copyright © 2020 Projectum. All rights reserved.
//

import Foundation

class Currency {
    var title: String
    var isChecked: Bool
    var rate: Double?
    
    init(title: String, isChecked: Bool, rate: Double?) {
        self.title = title
        self.isChecked = isChecked
        self.rate = rate
    }
    
    static var allCurrencies: [Currency] = [Currency(title: "EUR", isChecked: true, rate: nil), Currency(title: "USD", isChecked: false, rate: nil), Currency(title: "GBP", isChecked: false, rate: nil), Currency(title: "RUB", isChecked: false, rate: nil), Currency(title: "HKD", isChecked: false, rate: nil), Currency(title: "IDR", isChecked: false, rate: nil), Currency(title: "ILS", isChecked: false, rate: nil), Currency(title: "DKK", isChecked: false, rate: nil), Currency(title: "INR", isChecked: false, rate: nil), Currency(title: "CHF", isChecked: false, rate: nil), Currency(title: "MXN", isChecked: false, rate: nil), Currency(title: "SZK", isChecked: false, rate: nil), Currency(title: "SGD", isChecked: false, rate: nil), Currency(title: "THB", isChecked: false, rate: nil), Currency(title: "HRK", isChecked: false, rate: nil), Currency(title: "MYR", isChecked: false, rate: nil), Currency(title: "NOK", isChecked: false, rate: nil), Currency(title: "CNY", isChecked: false, rate: nil), Currency(title: "BGN", isChecked: false, rate: nil), Currency(title: "PHP", isChecked: false, rate: nil), Currency(title: "SEK", isChecked: false, rate: nil), Currency(title: "PLN", isChecked: false, rate: nil), Currency(title: "ZAR", isChecked: false, rate: nil), Currency(title: "CAD", isChecked: false, rate: nil), Currency(title: "ISK", isChecked: false, rate: nil), Currency(title: "BRL", isChecked: false, rate: nil), Currency(title: "RON", isChecked: false, rate: nil), Currency(title: "NZD", isChecked: false, rate: nil), Currency(title: "TRY", isChecked: false, rate: nil), Currency(title: "JPY", isChecked: false, rate: nil), Currency(title: "KRW", isChecked: false, rate: nil), Currency(title: "HUF", isChecked: false, rate: nil), Currency(title: "AUD", isChecked: false, rate: nil)]
}
