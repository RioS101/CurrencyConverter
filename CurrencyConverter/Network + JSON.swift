//
//  Network + JSON.swift
//  CurrencyConverter
//
//  Created by Riad on 6/1/20.
//  Copyright © 2020 Projectum. All rights reserved.
//

import Foundation

extension Currency {
    
    static func fetchRates(query: [String: String], completion: @escaping (ResponseRates?) -> Void) {
        
        let session = URLSession.shared
        session.configuration.timeoutIntervalForRequest = 5.0
        
        let baseURL = URL(string: "https://api.ratesapi.io/api/latest")!
        let url = baseURL.withqueries(query)!
        
        let task = session.dataTask(with: url) { (data, response, error) in
            let jsonDecoder = JSONDecoder()
            if let data = data,
                let rates = try? jsonDecoder.decode(ResponseRates.self, from: data) {
                completion(rates)
            } else {
                print("Either no data was returned, or data was not properly decoded")
                completion(nil)
            }
        }
        task.resume()
    }
}

//gives ability to dynamically change query parameter in request
extension URL {
    func withqueries(_ queries: [String: String]) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.map
            { URLQueryItem(name: $0.0, value: $0.1) }
        return components?.url
    }
    
    //in this app we do not need this helper method because protocol of our API is already https. But if you want to support more secure protocol https over http just use this method when constucting url (simple type .withHTTPS() )
    func withHTTPS() -> URL? {
        var components = URLComponents.init(url: self, resolvingAgainstBaseURL: true)
        components?.scheme = "https"
        return components?.url
    }
}
