//
//  ContentView.swift
//  5G-Monitoring-app
//
//  Created by Eddie Aloja on 11/11/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    
    var body: some View {
        
        TabView{
            
            StatsView()
                .tabItem{
                    Image(systemName: "chart.line.text.clipboard")
                    Text("Stats")
                }
            HomeView()
                .tabItem{
                    Image(systemName: "timer")
                    Text("Home")
                }
            UserView()
                .tabItem{
                    Image(systemName: "person.crop.circle")
                    Text("User")
                }
        }
    }
}

#Preview {
    ContentView()
}
