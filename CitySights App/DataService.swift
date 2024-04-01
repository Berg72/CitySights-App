//
//  DataService.swift
//  CitySights App
//
//  Created by Mark Bergeson on 3/31/24.
//

import Foundation

struct DataService {
    
    let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String
    
    func businessSearch() async {
        
        guard apiKey != nil else {
            return
        }
        
        if let url = URL(string: "https://api.yelp.com/v3/businesses/search?latitude=38.804071582599775&longitude=-121.34446939810248&categories=resturants&limit=10") {
            
            
            var request = URLRequest(url: url)
            request.addValue("Bearer \(apiKey!)", forHTTPHeaderField: "Authorization")
            request.addValue("application/json", forHTTPHeaderField: "accept")
            
            do {
                let (data, response) = try await URLSession.shared.data(for: request)
                print(data)
                print(response)
            }
            catch {
                print(error)
            }
        }
        
    }
}
