//
//  ContentView.swift
//  MemoryGame
//
//  Created by student on 17/10/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var  emojis = ["😀", "😃", "😁", "😆", "😅", "😂", "😀",
                          "😃", "😁", "😆", "😅", "😂"]
    @State var chosenTheme = 1
    @State var numberOfCards = 2
    
    var body: some View {
        let cards = cardLayoutView()
        VStack {
            VStack {
                Text("Memo").font(.largeTitle)
                cards
                Spacer()
                HStack {
                    ThemeButtonView(chosenTheme: $chosenTheme, emojis: $emojis, buttonOptionText: "1")
                    Spacer()
                    ThemeButtonView(chosenTheme: $chosenTheme, emojis: $emojis, buttonOptionText: "2")
                    Spacer()
                    ThemeButtonView(chosenTheme: $chosenTheme, emojis: $emojis, buttonOptionText: "3")
                }
           }.padding()
        }
        .padding()
        
//        VStack {
//            HStack{
//                Button( action: {
//                    if numberOfCards >= 4 {
//                        numberOfCards -= 2
//                    }
//                }, label: {
//                    Text("-")
//                })
//                .frame(width: 20, height: 20)
//                Button( action: {
//                    numberOfCards += 2
//                }, label: {
//                    Text("+")
//                })
//                .frame(width: 20, height: 20)
//            }
//        }
    }
    
//    func adjustCardNumber(by offset: Int, symbol: String) -> some View {
//        let count: Int = numberOfCards + offset
//
//        var state: Bool = false
//        if count < 2 || count > emojis.count {
//            state.toggle()
//        }
//
//        return Button(symbol) {numberOfCards += offset}
//            .disabled(state)
//            .frame(width: 30, height: 20)
//            .border(.blue)
//    }
    
    func cardLayoutView() -> some View {
            return (
    //            ScrollView {
    //                LazyVGrid(columns: [GridItem(.adaptive(minimum: 120), spacing: 16)], spacing: 16) {
    //                    ForEach(0 ..< numberOfCards, id:\.self) { index in
    //                        if index < emojis.count {
    //                            //Text(emojis[index])
    //                            CardView(emoji: emojis[index])
    //                                .background(Color.blue)
    //                        }
    //
    //                    }
    //                }
    //            }
                ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 70), spacing: 3)], spacing: 3) {
    //                    ForEach(0..<numberOfCards, id: \.self) { index in
    //                        CardView(content: emojis[index], chosenTheme: $chosenTheme).aspectRatio(2/3, contentMode: .fit)
    //                    }
                        ForEach(0..<emojis.count, id: \.self) { index in
                            CardView(cardText: emojis[index], chosenTheme: $chosenTheme).aspectRatio(2/3, contentMode: .fit)
                        }
                    }
                }
            )
        }
    
    
}


//#Preview {
//    ContentView()
//}
