//
//  MemoGameViewModel.swift
//  MemoryGame
//
//  Created by Damian on 07/11/2023.
//

import SwiftUI

class MemoGameViewModel : ObservableObject{
    //private static let emojis = ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐷", "🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐷"]
    private static let emojis = [Color.blue : ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐶", "🐱", "🐭", "🐹", "🐰", "🦊"],
                                 Color.red : ["😀", "😃", "😁", "😆", "😅", "😂", "😀", "😃", "😁", "😆", "😅", "😂"],
                                 Color.green : ["⚽️", "🏀", "🏈", "⚾️", "🏐", "🏉", "🥏", "🎱", "⚽️", "🏀", "🏈", "⚾️"]]
    //private static let emojisForTheme1 = ["😀", "😃", "😁", "😆", "😅", "😂", "😀", "😃", "😁", "😆", "😅", "😂"]
    //private static let emojisForTheme2 = ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐷", "🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐷"]
    //private static let emojisForTheme3 = ["⚽️", "🏀", "🏈", "⚾️", "🥎", "🎾", "🏐", "🏉", "🥏", "🎱", "⚽️", "🏀", "🏈", "⚾️", "🥎", "🎾", "🏐", "🏉", "🥏", "🎱"]
    //static var currentEmojis = emojisForTheme2
    @Published var themeColor = Color.blue
    static var theme = Color.blue
    
    private static func createMemoGameModel() -> MemoGameModel<String> {
        return MemoGameModel<String>(numberOfPairsOfCards: 8) { index in
                if emojis[theme]!.indices.contains(index) {
                    return emojis[theme]![index]
                } else {
                    return "??"
                }
            }
    }
    
    @Published private var model = createMemoGameModel()
    
    var score: Int {
            model.score
        }
    
    var cards: [MemoGameModel<String>.Card] {
            model.cards
        }
//    var cards: Array<MemoGameModel<String>.Card> {
//        return model.cards
//    }
    
    func shuffle() {
        model.shuffle()
    }
    
//    func choose(card: MemoGameModel<String>.Card) {
//        model.choose(card: card)
//    }
    
    func choose(_ card: MemoGameModel<String>.Card) {
        model.choose(card)
    }
    
    func changeTheme(color: Color) {
        themeColor = color
        MemoGameViewModel.theme = color
        model.score = 0
        
        model.changeCardSet(numberOfPairsOfCards: 8) {
            index in
            if MemoGameViewModel.emojis[MemoGameViewModel.theme]!.indices.contains(index) {
                return MemoGameViewModel.emojis[MemoGameViewModel.theme]![index]
            } else {
                return "??"
            }
        }
    }
}

//struct MemoGameViewModel_Previews: PreviewProvider {
//    static var previews: some View {
//        MemoGameViewModel()
//    }
//}
