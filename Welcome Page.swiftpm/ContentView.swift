import SwiftUI

struct ContentView: View {
    var body: some View {
        
        TabView {
            WelcomePageView()
            FeaturePageView()
            EjemploView()
        }
        .tabViewStyle(.page)
    }
}
