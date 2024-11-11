//
//  LocationManager.swift
//  5G-Monitoring-app
//
//  Created by Eddie Aloja on 11/11/2024.
//

import Foundation
import CoreLocation
import Combine

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    private var locationManager: CLLocationManager?
    
    // Published properties to update the UI
    @Published var userLocation: CLLocation?
    @Published var authorizationStatus: CLAuthorizationStatus = .notDetermined
    
    override init() {
        super.init()
        
        // Initialize CLLocationManager and set the delegate
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        
        // Request location permission when the manager is initialized
        locationManager?.requestWhenInUseAuthorization()
    }
    
    // Start updating the location (keep updating as long as the app is in the foreground)
    func startUpdatingLocation() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager?.startUpdatingLocation()
        }
    }
    
    // Stop updating the location (called when the app goes to the background)
    func stopUpdatingLocation() {
        locationManager?.stopUpdatingLocation()
    }
    
    // CLLocationManagerDelegate method to handle updated location
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // Get the most recent location
        if let location = locations.last {
            userLocation = location
        }
    }
    
    // CLLocationManagerDelegate method to handle authorization status changes
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        authorizationStatus = status
    }
}

