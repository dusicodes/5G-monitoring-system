//
//  AuthView.swift
//  5G-Monitoring-app
//
//  Created by Eddie Aloja on 13/11/2024.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth
import GoogleSignIn
class User {
     var name: String
     var email: String
     var photoURL: String
    
    init(parameters: (name: String, email: String, photoURL: String)) {
        self.email = parameters.email
        self.name = parameters.name
        self.photoURL = parameters.photoURL
    }
    
    
}
class AuthView: ObservableObject {
    
    @Published var isLoggedIn = false
    @Published var currentUser: User?  // This will hold the user object after login
        
    
    func signInWithGoogle(){
        
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        

        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config

        // Start the sign in flow!
        GIDSignIn.sharedInstance.signIn(withPresenting: Application_utility.rootViewController){user, error in
          if let error = error  {
              print(error.localizedDescription)
              return
          }

            guard let user = user?.user,
            let idToken = user.idToken?.tokenString
          else {
                return
          }
            let accessToken = user.accessToken

          let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                         accessToken: accessToken.tokenString)
            Auth.auth().signIn(with: credential) { result, error in
                
                if let error = error  {
                    print(error.localizedDescription)
                    return
                }

              // At this point, our user is signed in
                self.isLoggedIn = true
                guard let user = result?.user else { return }
                print(user)
                
            }
                

        }

        
    }
    
    func signOut(){
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
    }
    
}

