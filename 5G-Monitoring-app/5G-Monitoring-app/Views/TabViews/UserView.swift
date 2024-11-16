//
//  UserView.swift
//  5G-Monitoring-app
//
//  Created by Eddie Aloja on 11/11/2024.
//

import SwiftUI

struct UserView: View {
    var body: some View {
        VStack {
            Text("Settings")
                .font(.largeTitle) // Make the font large
                .fontWeight(.semibold) // Bold for emphasis
                .monospaced() // Monospaced font if preferred
            Button {
                Task {
                    AuthView().signOut()
                }
            } label: {
                Text("Log Out")
                    .padding()
                    .font(.body) // You can adjust the font size or style here
                    .foregroundColor(.black) // Text color
            }
            .frame(width: 250, height: 50)
            .background(Color(.systemGray5))
            .cornerRadius(10) // Rounded corners
            
            


        }
        .padding()
    }
    
}

#Preview {
    UserView()
}
