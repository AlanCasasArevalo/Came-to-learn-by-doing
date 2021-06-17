import SwiftUI

struct ContentView: View {
    
    let cards: [CardModel]
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack (alignment: .center, spacing: 20) {
                ForEach(cards) { item in
                    CardView(card: item)
                }
            }
            .padding(20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(cards: cardData)
    }
}
