//
//  MemoGameModel.swift
//  MemoryGame
//
//  Created by Damian on 07/11/2023.
//

import SwiftUI

//struct MemoGameModel: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}

struct MemoGameModel<CardContent> {
//    zmienną prywatną, dla ustawienia wartości, przechowującą tablicę kart;
    private(set) var cards : Array<Card>
    
//    • funkcję inicjującą dane kart na podstawie liczby par kart oraz zmiennej funkcyjnej przyjmującej
//    parametr typu Int i zwracającej zawartość karty:
//    init(numberOfPairsOfCards: Int, cardContentFactory: (Int)->
//    CardContent)
//    Należy zastosować pętlę for z uwzględnieniem, że minimalna liczba par to dwie;
    init(numberOfPairsOfCards: Int, cardContentFactory : (Int)->CardContent) {
        cards = []
        for pairIndex in 0..<max(2,numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
//    • funkcję do wyboru karty przyjmującą parametr karta;
    mutating func choose(_ card: Card) {
        let chosenIndex = index(of: card)
        cards[chosenIndex].isFaceUp.toggle()
    }
    
    func index(of card: Card) -> Int {
        for index in cards.indices {
            if cards[index].id == card.id {
                return index
            }
        }
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
    
//    • strukturę dla pojedynczej karty składającą się z:
//    o informacji, czy karta jest odwrócona, z domyślną wartością false;
//    o informacji, czy karta pasuje do drugiej, z domyślną wartością false.
//    o zawartości karty;
    struct Card  {
        //var id: String
        
        var isFaceUp = true
        var isMatched = false
        var content : CardContent
    }
}


//struct MemoGameModel_Previews: PreviewProvider {
//    static var previews: some View {
//        MemoGameModel()
//    }
//}