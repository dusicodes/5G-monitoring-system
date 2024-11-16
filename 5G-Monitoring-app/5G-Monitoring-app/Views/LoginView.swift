//
//  LoginScreen.swift
//  5G-Monitoring-app
//
//  Created by Eddie Aloja on 13/11/2024.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift

struct LoginScreen: View {
    @State private var vm = AuthView()
    @State private var isLoggedIn = false
    var body: some View {
        NavigationStack{
            Text("Welcome To 5G Monitoring App")
                .font(.largeTitle)
                .monospaced()
                .fontWeight(.black)
                .bold()
                .padding()
            Button(action: {
                vm.signInWithGoogle()
            } ) {
                HStack {
                    // Google Logo (replace "google_logo" with the actual image name in your assets)
                    Image("google") // Use your own image for the Google logo
                        .resizable()
                        .frame(width: 30, height: 30)
                    
                    Text("Sign in with Google")
                        .foregroundColor(.black)
                        .fontWeight(.medium)
                        .padding(.leading, 8)
                }
                .padding()
                .frame(maxWidth: .infinity) // Makes the button expand to the edges
                .background(Color(.systemGray5)) // Gray background similar to Google button
                .cornerRadius(10) // Rounded corners
            }
            .frame(width: 250, height: 50) // Adjusts size to look like a standard Google button
            .shadow(radius: 3) // Optional: adds a shadow for depth
            .navigationDestination(isPresented: $isLoggedIn){
                ContentView()
                    .navigationBarBackButtonHidden(true)
            }
        }
        
    }
}
       
#Preview {
    LoginScreen()
}
