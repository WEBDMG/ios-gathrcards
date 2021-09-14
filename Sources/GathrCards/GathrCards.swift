//
//  CardView.swift
//  Gathr Design System
//
//  Created by Richard Robinson on 9/10/21.
//

import SwiftUI
import SDWebImageSwiftUI
import GathrColors


/// Card view for use in list
public struct GathrCards: View {
    public init(card: Card) {
        self.card = card
    }
    
    public var card:Card
    public var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(Color.gathrsurface)
            VStack(alignment: .leading){
                switch UIDevice.current.userInterfaceIdiom {
                case .pad:
                    // It's an iPad (or macOS Catalyst)
                    WebImage(url: URL(string: card.image)).resizable().aspectRatio(contentMode: .fill).cornerRadius(10, corners: [.topLeft, .topRight])
                case .unspecified:
                    WebImage(url: URL(string: card.image)).resizable().aspectRatio(contentMode: .fit).cornerRadius(10, corners: [.topLeft, .topRight])
                case .phone:
                    WebImage(url: URL(string: card.image)).resizable().aspectRatio(contentMode: .fit).cornerRadius(10, corners: [.topLeft, .topRight])
                case .tv:
                    WebImage(url: URL(string: card.image)).resizable().aspectRatio(contentMode: .fill).cornerRadius(10, corners: [.topLeft, .topRight])
                case .carPlay:
                    WebImage(url: URL(string: card.image)).resizable().aspectRatio(contentMode: .fit).cornerRadius(10, corners: [.topLeft, .topRight])
                case .mac:
                    WebImage(url: URL(string: card.image)).resizable().aspectRatio(contentMode: .fill).cornerRadius(10, corners: [.topLeft, .topRight])
                @unknown default:
                    // Uh, oh! What could it be?
                    WebImage(url: URL(string: card.image)).resizable().aspectRatio(contentMode: .fit).cornerRadius(10, corners: [.topLeft, .topRight])
                }
                
                VStack(alignment: .leading){
                    Text(card.caption).font(.subheadline).fontWeight(.semibold).foregroundColor(Color.gathrsecondary)
                    Spacer()
                    Text(card.title).font(.largeTitle).fontWeight(.bold)
                    Text(card.body).font(.body).padding(.vertical)
                }.padding()
            }
        }.frame( minHeight:350)
    }
}

/// Single Card View
public struct GathrCard: View {
    public init(card: Card) {
        self.card = card
    }
    
    public var card:Card
    public var body: some View {
        GathrCards(card: card)
            .padding(.horizontal)
    }
}

struct GathrCards_Previews: PreviewProvider {
    static var previews: some View {
        GathrCards(card: CardTestData)
    }
}

struct GathrCard_Previews: PreviewProvider {
    static var previews: some View {
        GathrCard(card: CardTestData)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
