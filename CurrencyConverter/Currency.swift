//
//  Currency.swift
//  CurrencyConverter
//
//  Created by Riad on 5/25/20.
//  Copyright © 2020 Projectum. All rights reserved.
//

import Foundation

struct Currency {
    let title: String
    var rate: Double

    static let sampleData: [String: Double] = [
        "Eur": 2.34,
        "USD": 1.78,
        "Azn": 1
    ]
    
}
