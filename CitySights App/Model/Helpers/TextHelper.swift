//
//  TextHelper.swift
//  CitySights App
//
//  Created by Mark Bergeson on 4/3/24.
//

import Foundation

struct TextHelper {
    
    static func distanceAwayText(meters: Double) -> String {
        
        if meters > 1000 {
            return "\(Int(round(meters/1000))) km away"
        } else {
            return "\(Int(round(meters))) m away"
        }
    }
}
