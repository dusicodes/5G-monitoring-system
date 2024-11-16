import SwiftUI

struct WelcomeView: View {
    @State private var selectedTab = 0  // Track the selected tab index
    @State private var showButton = false // State to control button visibility
    @State private var navigateToLocation = false
    var body: some View {
        NavigationStack{
            VStack {
                TabView(selection: $selectedTab) {
                    OnboardingView(viewImage: "lightbulb.min", viewText: "Get a detailed view of your 5g networks performance. Whether at home work or on the go. Easily monitoring signal strengths.", viewTitle: "Welcome To 5G Monitoring App")
                        .tag(0)
                    
                    OnboardingView(viewImage: "lightbulb.min", viewText: "Our app gives you real time insight into your 5G signal strength so you can identify areas of poor coverage and stay connected with ease.", viewTitle: "Instant Signal Insights")
                        .tag(1)
                    
                    OnboardingView(viewImage: "lightbulb.min", viewText: "With our app you can monitor your signal strength at any time. No need to wait for a signal to connect.", viewTitle: "Stay Connected Anytime")
                        .tag(2)
                }
                .tabViewStyle(.page(indexDisplayMode: .always))
                .indexViewStyle(.page(backgroundDisplayMode: .always))
                .onChange(of: selectedTab) { newTab in
                    // Trigger the button to appear only when reaching the last tab
                    withAnimation {
                        showButton = newTab == 2
                        navigateToLocation = true
                    }
                }
                
                // Conditionally display the "Get Started" button with animation
                if showButton {
                    NavigationLink(destination: LocationViewUp()){
                        Button(action: {
                            print("Get Started tapped!")
                            
                            // Perform the action (navigate or whatever you need)
                        }) {
                            Text("Get Started")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color(.systemGray))
                                .cornerRadius(10)
                        }
                        .padding(.horizontal, 40) // Center button horizontally (adjust as needed)
                        .padding(.top, 20) // Space from the TabView
                        .transition(.move(edge: .bottom)) // Apply the transition for the button
                        .animation(.easeInOut, value: showButton) // Animate the appearance and disappearance of the button
                    }
                } else {
                    // Make sure the button is fully removed from the view hierarchy
                    EmptyView()
                        .transition(.move(edge: .bottom)) // No need to animate disappearance since it's removed
                }
            }

        }
    }
}

struct OnboardingView: View {
    var viewImage: String
    var viewText: String
    var viewTitle: String
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: viewImage)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            
            Text(viewTitle)
                .font(.largeTitle)
                .fontWeight(.bold)
                .monospaced()
            
            Text(viewText)
        }
        .padding(.horizontal, 40)
    }
}

struct LocationViewUp : View {
    var body : some View{
        VStack{
            Text("You have navigated to the new view!")
                .font(.title)
                .padding()
            
            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 10)
        .transition(.move(edge: .bottom)) // Slide up transition
        

    }
}


#Preview {
    WelcomeView()
}
