import SwiftUI

struct CardView: View {
    
    // MARK: - Properties
    @State var fadeIn = false
    @State var moveDownard = false
    @State var moveUpward = false
    @State var showAlert = false

    let card: CardModel
    var hapticImpact = UIImpactFeedbackGenerator(style: .heavy)

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
            .offset(y: moveDownard ? -218 : -300)
            
            Image(card.imageName)
                .zIndex(0)
                .opacity(fadeIn ? 1 : 0)
            
            Button(action: {
                AudioPlayerManager.shared.playSound(forResource: "sound-chime", ofType: "mp3")
                hapticImpact.impactOccurred()
                showAlert.toggle()
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
            .offset(y: moveUpward ? 218 : 300)
        }
        .frame(width: 335, height: 545)
        .background(
            LinearGradient(gradient: Gradient(colors: card.gradientColors), startPoint: .top, endPoint: .bottom)
        )
        .cornerRadius(16.0)
        .shadow(radius: 8)
        .onAppear {
            withAnimation(.linear(duration: 1)) {
                fadeIn.toggle()
            }
            withAnimation(.linear(duration: 0.8)) {
                moveDownard.toggle()
                moveUpward.toggle()
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text(card.title),
                message: Text(card.message),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: cardData[0])
            .previewLayout(.sizeThatFits)
    }
}
