//
//  LoginScreen.swift
//  5G-Monitoring-app
//
//  Created by Eddie Aloja on 13/11/2024.
//

import SwiftUI
import GoogleSignIn

struct LoginScreen: View {

    var body: some View {
        Text("Sign In to Get Started!")
            .monospaced()
            .fontWeight(.black)
            .bold()
            .padding()
        Button(action: handleSignInGoogle) {
           Text("Sign in with Google")
            
        }
    }
}

func handleSignInGoogle(){
    print("The button has been clicked")

}
#Preview {
    LoginScreen()
}
