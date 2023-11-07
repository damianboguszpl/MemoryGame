//
//  CardView.swift
//  MemoryGame
//
//  Created by student on 17/10/2023.
//
import SwiftUI

struct CardView: View {
    var card: MemoGameModel<String>.Card
    
    init(_ card: MemoGameModel<String>.Card) {
        self.card = card
    }
    
    var body: some View {
            ZStack {
                let backgroundRect = RoundedRectangle(cornerRadius: 12)
                Group {
                    backgroundRect.fill(.white)
                    backgroundRect.strokeBorder(lineWidth: 3)
                    Text(card.content)
                        .font(.system(size: 200))
                        .minimumScaleFactor(0.01)
                        .aspectRatio(1, contentMode: .fit)
                }
                .opacity(card.isFaceUp ? 1 : 0)
                backgroundRect.fill().opacity(card.isFaceUp ? 0 : 1)
            }
    
    }
}




//// Lab 4 and earlier
//struct CardView: View {
//    var cardText: String
//    @State var visibilityState:Bool = false
//    let colors = [Color.blue, Color.red, Color.green]
//    @Binding var chosenTheme: Int
//
//    var body: some View {
//            let backgroundRect = RoundedRectangle(cornerRadius: 12)
//
//            ZStack {
//                backgroundRect.fill(colors[chosenTheme - 1])
//                Group {
//                    backgroundRect.fill(.white)
//                    backgroundRect.stroke(colors[chosenTheme - 1], lineWidth:2)
//                    Text(cardText).font(.largeTitle)
//                }
//                .opacity(visibilityState ? 1 : 0)
//            }
//
//        .onTapGesture {
//            visibilityState.toggle()
//        }
//
//    }
//}
