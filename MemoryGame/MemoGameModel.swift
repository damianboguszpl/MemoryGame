//
//  MemoGameModel.swift
//  MemoryGame
//
//  Created by Damian on 07/11/2023.
//

import SwiftUI

struct MemoGameModel<CardContent> where CardContent:Equatable{
//    zmienną prywatną, dla ustawienia wartości, przechowującą tablicę kart;
    private (set) var cards : Array<Card>
    
//    • funkcję inicjującą dane kart na podstawie liczby par kart oraz zmiennej funkcyjnej przyjmującej
//    parametr typu Int i zwracającej zawartość karty:
//    init(numberOfPairsOfCards: Int, cardContentFactory: (Int)->
//    CardContent)
//    Należy zastosować pętlę for z uwzględnieniem, że minimalna liczba par to dwie;
    init(numberOfPairsOfCards: Int, cardContentFactory : (Int)->CardContent) {
        cards = []
        for pairIndex in 0..<max(2,numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id: "\(pairIndex+1)a", content: content))
            cards.append(Card(id: "\(pairIndex+1)b", content: content))
        }
        cards.shuffle()
    }
    
    mutating func changeCardSet(numberOfPairsOfCards: Int, cardContentFactory : (Int)->CardContent) {
        cards = []
        for pairIndex in 0..<max(2,numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id: "\(pairIndex+1)a", content: content))
            cards.append(Card(id: "\(pairIndex+1)b", content: content))
        }
        cards.shuffle()
    }
    
//    • funkcję do wyboru karty przyjmującą parametr karta;
//    mutating func choose( card: Card) {
//        let chosenIndex = index(of: card)
//        cards[chosenIndex!].isFaceUp.toggle()
//    }
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = index(of: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
            } else {
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
            cards[chosenIndex].isFaceUp = true
        }
    }
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter { cards[$0].isFaceUp }.oneAndOnly }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    func index(of card: Card) -> Int? {
        for index in cards.indices {
            if cards[index].id == card.id {
                return index
            }
        }
        return nil
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
    
//    • strukturę dla pojedynczej karty składającą się z:
//    o informacji, czy karta jest odwrócona, z domyślną wartością false;
//    o informacji, czy karta pasuje do drugiej, z domyślną wartością false.
//    o zawartości karty;
    struct Card : Equatable, Identifiable, CustomDebugStringConvertible{
        var id: String
        
        var isFaceUp = false
        var isMatched = false
        var content : CardContent
        
        var debugDescription: String {
            return "\(id): \(content) \(isFaceUp ? "up" : "down") \(isMatched ? "matched" : "")"
        }
    }
}

extension Array {
    var oneAndOnly: Element? {
        if count == 1 {
            return first
        } else {
            return nil
        }
    }
}
//struct MemoGameModel_Previews: PreviewProvider {
//    static var previews: some View {
//        MemoGameModel()
//    }
//}
