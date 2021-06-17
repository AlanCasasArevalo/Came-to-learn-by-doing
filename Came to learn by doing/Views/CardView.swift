import SwiftUI

struct CardView: View {
    
    // MARK: - Properties
    let card: CardModel
    
    var body: some View {
        ZStack {
            VStack {
                Text(card.title)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                
                Text(card.headline)
                    .fontWeight(.light)
                    .italic()
            }
            .foregroundColor(.white)
            .zIndex(1.0)
            .offset(y: -218)
            
            Image(card.imageName)
                .zIndex(0)
            
            Button(action: {
                print(card.callToAction)
                AudioPlayerManager.shared.playSound(forResource: "sound-chime", ofType: "mp3")
            }, label: {
                HStack {
                    Text(card.callToAction.uppercased())
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    Image.init(systemName: "arrow.right.circle")
                        .font(Font.title.weight(.medium))
                        .foregroundColor(.white)

                }
                .padding(.vertical)
                .padding(.horizontal, 24)
                .background(
                    LinearGradient(gradient: Gradient(colors: card.gradientColors), startPoint: .leading, endPoint: .trailing)
                )
                .clipShape(Capsule())
                .shadow(color: Color.init("ColorShadow"), radius: 6, x: 0, y: 3)
            })
            .offset(y: 218)
        }
        .frame(width: 335, height: 545)
        .background(
            LinearGradient(gradient: Gradient(colors: card.gradientColors), startPoint: .top, endPoint: .bottom)
        )
        .cornerRadius(16.0)
        .shadow(radius: 8)
        
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: cardData[0])
            .previewLayout(.sizeThatFits)
    }
}
