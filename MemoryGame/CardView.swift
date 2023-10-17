//
//  CardView.swift
//  MemoryGame
//
//  Created by student on 17/10/2023.
//
import SwiftUI
struct CardView: View {
    var emoji:String
    @State var visibilityState:Bool = true
    
    var body: some View {
        ZStack {
            Group {
                
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.blue, lineWidth:2)
                    .background(Color.white)
                   
                Text(emoji)
                    .font(.largeTitle)
                
            }
            .opacity(visibilityState ? 0 : 1)
            
            RoundedRectangle(cornerRadius: 12)
                .stroke(.white, lineWidth:2)
                .background(Color.blue)
                .opacity(visibilityState ? 1 : 0)
           
        }
        
        .onTapGesture {
            visibilityState.toggle()
        }
        
    }
}
#Preview {
    CardView(emoji: "😀")
}
