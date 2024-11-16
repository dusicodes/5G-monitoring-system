//
//  HomeView.swift
//  5G-Monitoring-app
//
//  Created by Eddie Aloja on 11/11/2024.
//

import SwiftUI
import CoreLocation

struct HomeView: View {
    @StateObject var locationManager = LocationManager()
    private var app = MainApp()
    var body: some View {
        VStack {

            Button(action: {
                print("hello")
                
            }){
                Image(systemName: "antenna.radiowaves.left.and.right")
                //on tap check
                    .padding()
                    .font(.system(size: 80)) // Adjust the size of the symbol
                    .foregroundStyle(.white)
            }
            .frame(width: 200, height: 200) // Make the button a circle with a fixed size
            .background(Color.black) // Background color of the button
            .clipShape(Circle()) // Clip the button to be circular
            .overlay(
                Circle().stroke(Color.white, lineWidth: 4) // Optional border around the button
            )
            .shadow(radius: 10) // Optional shadow for the button
            
            
        }
        .padding()
    }
}
#Preview {
    HomeView()
}
