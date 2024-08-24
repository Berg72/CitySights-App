//
//  BusinessModel.swift
//  CitySights App
//
//  Created by Mark Bergeson on 4/12/24.
//

import Foundation
import SwiftUI
import CoreLocation

@Observable
class BusinessModel: NSObject, CLLocationManagerDelegate {
    
    var businesses = [Business]()
    
    var selectedBusiness: Business?
    
    var service = DataService()
    var locationManager = CLLocationManager()
    var currentUserLocation: CLLocationCoordinate2D?
    
    var locationAuthStatus: CLAuthorizationStatus = .notDetermined
    
    override init() {
        super.init()
        
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.delegate = self
    }
    
    func getBusinesses(query: String?, options: String?, category: String?) {
        
        Task {
            businesses = await service.businessSearch(userLocation: currentUserLocation, query: query, options: options, category: category)
        }
    }
    
    func getUserLocation() {
        
        if locationManager.authorizationStatus == .authorizedWhenInUse {
            
            currentUserLocation = nil
            locationManager.requestLocation()
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print(error)
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        self.locationAuthStatus = manager.authorizationStatus
        
        if manager.authorizationStatus == .authorizedWhenInUse {
            
            currentUserLocation = nil
            manager.requestLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if currentUserLocation == nil {
            
            currentUserLocation = locations.last?.coordinate
            getBusinesses(query: nil, options: nil, category: nil)
        }
        
        manager.stopUpdatingLocation()
    }
    
}
