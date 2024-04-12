//
//  BusinessModel.swift
//  CitySights App
//
//  Created by Mark Bergeson on 4/12/24.
//

import Foundation
import SwiftUI

@Observable
class BusinessModel {
    
    var businesses = [Business]()
    var query: String = ""
    var selectedBusiness: Business?
    
    var service = DataService()
    
    func getBusinesses() {
        
        Task {
            businesses = await service.businessSearch()
        }
    }
}
