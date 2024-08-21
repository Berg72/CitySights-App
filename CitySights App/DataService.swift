//
//  DataService.swift
//  CitySights App
//
//  Created by Mark Bergeson on 3/31/24.
//

import Foundation
import CoreLocation

struct DataService {
    
    let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String
    
    func businessSearch(userLocation: CLLocationCoordinate2D?, query: String?, options: String?, category: String?) async -> [Business] {
        
        guard apiKey != nil else {
            return [Business]()
        }
        
        var lat = 38.804071582599775
        var long = -121.34446939810248
        
        if let userLocation = userLocation {
            lat = userLocation.latitude
            long = userLocation.longitude
        }
        
        var endpointUrlString = "https://api.yelp.com/v3/businesses/search?latitude=\(lat)&longitude=\(long)&limit=10"
        
        if query != nil && query != "" {
            endpointUrlString.append("&term=\(query!.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)")
        }
        
        if options != nil && options != "" {
            endpointUrlString.append("&attributes=\(options!)")
        }
        
        if let category = category {
            endpointUrlString.append("&category=\(category)")
        }
        
//        1. Create url
        if let url = URL(string: endpointUrlString) {
            
//            2. Create request
            var request = URLRequest(url: url)
            request.addValue("Bearer \(apiKey!)", forHTTPHeaderField: "Authorization")
            request.addValue("application/json", forHTTPHeaderField: "accept")
            
//            3. Send request
            do {
                let (data, response) = try await URLSession.shared.data(for: request)
                
//                 4. Parse the JSON
                let decoder = JSONDecoder()
                let result = try decoder.decode(BusinessSearch.self, from: data)
                return result.businesses
            }
            catch {
                print(error)
            }
        }
        return [Business]()
    }
}
