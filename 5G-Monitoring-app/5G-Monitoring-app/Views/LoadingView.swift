//
//  LoadingView.swift
//  5G-Monitoring-app
//
//  Created by Eddie Aloja on 16/11/2024.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack{
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
    
        }
    }
}

#Preview {
    LoadingView()
}
