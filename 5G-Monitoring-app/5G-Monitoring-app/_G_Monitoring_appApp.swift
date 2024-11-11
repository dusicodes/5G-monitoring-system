//
//  _G_Monitoring_appApp.swift
//  5G-Monitoring-app
//
//  Created by Eddie Aloja on 11/11/2024.
//

import SwiftUI
import Firebase
import FirebaseCore



@main
struct _G_Monitoring_appApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication,
                     
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        print("Fire base works")
        return true
        
    }
    
}
