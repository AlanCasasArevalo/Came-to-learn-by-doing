import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack (alignment: .center, spacing: 20) {
                ForEach(0 ..< 6) { item in
                    CardView()
                }
            }
            .padding(20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
