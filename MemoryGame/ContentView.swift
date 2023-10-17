//
//  ContentView.swift
//  MemoryGame
//
//  Created by student on 17/10/2023.
//

import SwiftUI

struct ContentView: View {
    @State var numberOfCards = 2
    var body: some View {
        
        let emojis = ["😀","😐","🥶","😵‍💫","🥸","😎","😡","👻","🙉","💀"]
//        var cards = [CardView(emoji: emojis[0],state: false),
//                     CardView(emoji: emojis[1],state: false)]
        
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 120), spacing: 16)], spacing: 16) {
                    ForEach(0 ..< numberOfCards, id:\.self) { index in
                        if index < emojis.count {
                            //Text(emojis[index])
                            CardView(emoji: emojis[index])
                                .background(Color.blue)
                        }
                        
                    }
                }
            }
        }
        .padding()
        VStack {
            HStack{
                Button( action: {
                    if numberOfCards >= 4 {
                        numberOfCards -= 2
                    }
                }, label: {
                    Text("-")
                })
                .frame(width: 20, height: 20)
                Button( action: {
                    numberOfCards += 2
                }, label: {
                    Text("+")
                })
                .frame(width: 20, height: 20)
            }
        }
    }
}

#Preview {
    ContentView()
}
