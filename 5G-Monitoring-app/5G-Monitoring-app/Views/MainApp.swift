//
//  MainApp.swift
//  5G-Monitoring-app
//
//  Created by Eddie Aloja on 13/11/2024.
//

import SwiftUI

struct MainApp: View {
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
    MainApp()
}
