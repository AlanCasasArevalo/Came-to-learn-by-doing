import SwiftUI

struct CardView: View {
    
    // MARK: - Properties
    let gradient = [Color("Color01"), Color("Color02")]
    
    var body: some View {
        ZStack {
            VStack {
                Text("SwiftUI")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                
                Text("Better apps, less code")
                    .fontWeight(.light)
                    .italic()
            }
            .foregroundColor(.white)
            .zIndex(1.0)
            .offset(y: -218)
            
            Image("developer-no1")
                .zIndex(0)
            
            Button(action: {
                print("button was tapped")
            }, label: {
                HStack {
                    Text("Learn".uppercased())
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    Image.init(systemName: "arrow.right.circle")
                        .font(Font.title.weight(.medium))
                        .foregroundColor(.white)

                }
                .padding(.vertical)
                .padding(.horizontal, 24)
                .background(
                    LinearGradient(gradient: Gradient(colors: gradient), startPoint: .leading, endPoint: .trailing)
                )
                .clipShape(Capsule())
                .shadow(color: Color.init("ColorShadow"), radius: 6, x: 0, y: 3)
            })
            .offset(y: 218)
        }
        .frame(width: 335, height: 545)
        .background(
            LinearGradient(gradient: Gradient(colors: gradient), startPoint: .top, endPoint: .bottom)
        )
        .cornerRadius(16.0)
        .shadow(radius: 8)
        
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
            .previewLayout(.sizeThatFits)
    }
}
