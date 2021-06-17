import SwiftUI

struct CardModel: Identifiable {
    let id = UUID()
    let title: String
    let headline: String
    let imageName: String
    let callToAction: String
    let message: String
    let gradientColors : [Color]
}
