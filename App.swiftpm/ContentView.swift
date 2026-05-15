import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            
            HomeView()
                .tabItem {
                    Label("Inicio", systemImage: "star.circle.fill")
                }
            
            
            StoryView()
                .tabItem {
                    Label("Semblanza", systemImage: "star.circle.fill")
                }
            
            FavoritesView()
                .tabItem {
                    Label("Gustitos", systemImage: "star.circle.fill")
                }

        }
        
        

    }
}


struct ContentView_Prieviews: PreviewProvider{
    static var previews: some View{
        ContentView()
    }
}
