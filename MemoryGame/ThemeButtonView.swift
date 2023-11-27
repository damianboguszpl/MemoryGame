//
//  ThemeButtonView.swift
//  MemoryGame
//
//  Created by Damian on 30/10/2023.
//

import SwiftUI

struct ThemeButtonView: View {
    @ObservedObject var viewModel: MemoGameViewModel
    var imageName: String
    var content: String
    var ownColor = Color.blue
    
    var body: some View {
        Button(action: {
            viewModel.changeTheme(color: ownColor)
        }, label: {
            VStack{
                Image(systemName: imageName).font(.title)
                Text(content)
            }
        })
    }
}

// Przed lab 6
//struct ThemeButtonView: View {
//    @Binding var chosenTheme: Int
//    @Binding var emojis: Array<String>
//    @State var emojisForTheme1 = ["😀", "😃", "😁", "😆", "😅", "😂", "😀",
//                                  "😃", "😁", "😆", "😅", "😂"]//.shuffled()
//    @State var emojisForTheme2 = ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐷", "🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐷"]//.shuffled()
//    @State var emojisForTheme3 = ["⚽️", "🏀", "🏈", "⚾️", "🥎", "🎾", "🏐", "🏉", "🥏", "🎱", "⚽️", "🏀", "🏈", "⚾️", "🥎", "🎾", "🏐", "🏉", "🥏", "🎱"]//.shuffled()
//    let colors = [Color.blue, Color.red, Color.green]
//    let buttonOptionText: String
//
//    var body: some View {
//        Group {
//            if buttonOptionText == "1" {
//                Button {
//                    chosenTheme = 1
//                    emojis = emojisForTheme1
//                    shuffleContent()
//                } label: {
//                    VStack {
//                        Image(systemName: "smiley").font(.title)
//                        Text("Motyw 1")
//                    }
//                }
//            } else if buttonOptionText == "2" {
//                Button {
//                    chosenTheme = 2
//                    emojis = emojisForTheme2
//                    shuffleContent()
//                } label: {
//                    VStack {
//                        Image(systemName: "pawprint.circle").font(.title)
//                        Text("Motyw 2")
//                    }
//                }
//            } else {
//                Button {
//                    chosenTheme = 3
//                    emojis = emojisForTheme3
//                    shuffleContent()
//                } label: {
//                    VStack {
//                        Image(systemName: "figure.walk.circle").font(.title)
//                        Text("Motyw 3")
//                    }
//                }
//            }
//        }.foregroundColor(colors[chosenTheme - 1])
//    }
//
//    func shuffleContent() {
//        emojis = emojis.shuffled()
//    }
//}

//struct ThemeButtonView_Previews: PreviewProvider {
//    static var previews: some View {
//        ThemeButtonView()
//    }
//}
