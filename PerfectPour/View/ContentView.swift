import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            Text("Helloworld")
                .font(.largeTitle)
                .bold()
                .multilineTextAlignment(.leading)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
