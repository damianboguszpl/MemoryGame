//
//  MemoGameViewModel.swift
//  MemoryGame
//
//  Created by Damian on 07/11/2023.
//

import SwiftUI

class MemoGameViewModel : ObservableObject{
    private static let emojis = ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐷", "🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐷"]
    
    private static func createMemoGameModel() -> MemoGameModel<String> {
        return MemoGameModel<String>(numberOfPairsOfCards: 8) { index in
                if emojis.indices.contains(index) {
                    return emojis[index]
                } else {
                    return "??"
                }
            }
    }
    
    @Published private var model = createMemoGameModel()
    
    var cards: Array<MemoGameModel<String>.Card> {
        return model.cards
    }
    
    func shuffle() {
        model.shuffle()
    }
    
    func choose(card: MemoGameModel<String>.Card) {
        model.choose(card: card)
    }
}

//struct MemoGameViewModel_Previews: PreviewProvider {
//    static var previews: some View {
//        MemoGameViewModel()
//    }
//}
