import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            BrewLibraryView()
                .tabItem {
                    Label("Brew", systemImage: "mug.fill")
                }
            
            FeaturedView()
                .tabItem {
                    Label("Featured", systemImage: "star.fill")
                }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
