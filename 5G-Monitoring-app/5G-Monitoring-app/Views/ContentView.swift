//
//  ContentView.swift
//  5G-Monitoring-app
//
//  Created by Eddie Aloja on 11/11/2024.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    @State var userLoggedIn = (Auth.auth().currentUser != nil)
    var body: some View {
        VStack{
            if userLoggedIn {
                WelcomeView()
                //MainApp()
            }else {
                LoginScreen()
            }
            
        }.onAppear{
            Auth.auth().addStateDidChangeListener { Auth, user in
                if (user != nil){
                    userLoggedIn = true
                }else {
                    userLoggedIn = false
                }
            }
            
        }
        
    }
}

#Preview {
    ContentView()
}
