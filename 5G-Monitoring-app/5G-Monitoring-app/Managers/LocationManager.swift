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
    @Published var isLoading = false
    static let shared = LocationManager()
    
    override init() {
        super.init()
        
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        locationManager?.startUpdatingLocation()
    }
    func requestLocation(){
        isLoading = true
        locationManager?.requestWhenInUseAuthorization()
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
    func getCityName(latitude : Double, longitude: Double, completions: @escaping (String?) -> Void){
        let location = CLLocation(latitude : latitude, longitude: longitude)
        let geoCoder = CLGeocoder()
        
        geoCoder.reverseGeocodeLocation(location) { (placemarks, error) in
            if let error = error{
                print("Reverse geocoding failed: \(error.localizedDescription)")
                completions(nil)
                return
            }
            if let placemark = placemarks?.first {
                let city = placemark.locality
                completions(city)
            } else {
                print("no placemark found")
                completions(nil)
            }
        }
    }
}



