//
//  CardView.swift
//  MemoryGame
//
//  Created by student on 17/10/2023.
//

import SwiftUI

struct CardView: View {
    var card: MemoGameModel<String>.Card
    
//    @State private var isRotating = false
    
    init(_ card: MemoGameModel<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        let base = RoundedRectangle(cornerRadius: 12)
        base
//            .fill(card.isFaceUp ? .white : color)
            .overlay(
                Group{
//                    if card.isFaceUp {
                        
                            //.stroke(color, lineWidth:2)
//                            .fill(color)
                            //.background()
                        base.fill(.white)
                        base.strokeBorder(lineWidth: 3)
                        CirclePartShape()
                        Text(card.content)
                            .font(.system(size: 200))
                            .minimumScaleFactor(0.01)
                            .aspectRatio(1 ,contentMode: .fit)
                            .rotationEffect(.degrees( card.isMatched ? 360 : 0))
                            .animation(Animation.spin(duration: 2))
//                            .onAppear{
//                                withAnimation(.linear(duration: 2).repeatForever(autoreverses: false)){
//                                        if card.isMatched{
//                                            isRotating.toggle()
//                                        }
//                                    }
//                                }
//                            }
                    }
                    .opacity(card.isFaceUp ? 1 : 0)
            )
            .aspectRatio(2/3, contentMode: .fill)
            .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
//            .animation(.default, value: card.isFaceUp)
        
    }
}

extension Animation {
    static func spin(duration: Double) -> Animation{
        return Animation.linear(duration: duration).repeatForever(autoreverses: false)
    }
}



// lab 6 and earlier

//struct CardView: View {
//    var card: MemoGameModel<String>.Card
//
//    init(_ card: MemoGameModel<String>.Card) {
//        self.card = card
//    }
//
//    var body: some View {
//        ZStack{
//            let backgroundRect = RoundedRectangle(cornerRadius: 12)
//            Group{
//                backgroundRect.fill(.white)
//
//                backgroundRect.strokeBorder(lineWidth: 3)
//
//                Text(card.content)
//                    .font(.system(size: 200))
//                    .minimumScaleFactor(0.01)
//                    .aspectRatio(1 ,contentMode: .fit)
//            }.opacity(card.isFaceUp ? 1 : 0)
//
//            backgroundRect.fill().opacity(card.isFaceUp ? 0 : 1)
//        }.aspectRatio(2/3, contentMode: .fill).opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
//
////            ZStack {
////                let backgroundRect = RoundedRectangle(cornerRadius: 12)
////                Group {
////                    backgroundRect.fill(.white)
////                    backgroundRect.strokeBorder(lineWidth: 3)
////                    Text(card.content)
////                        .font(.system(size: 200))
////                        .minimumScaleFactor(0.01)
////                        .aspectRatio(1, contentMode: .fit)
////                }
////                .opacity(card.isFaceUp ? 1 : 0)
////                backgroundRect.fill().opacity(card.isFaceUp ? 0 : 1)
////            }
//
//    }
//}



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
