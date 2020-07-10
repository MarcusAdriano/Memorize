//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Marcus Adriano on 30/06/20.
//  Copyright © 2020 Marcus Adriano. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        HStack {
            ForEach(viewModel.cards, content: {card in
                CardView(card: card).onTapGesture {
                    self.viewModel.choose(card: card)
                }
            })
        }
        .padding()
        .foregroundColor(Color.orange)
        .font(Font.largeTitle)
    }
}

struct CardView: View {    
    var card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: lineEdgeWidth)
                Text(card.content)                
            } else {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.orange)
            }
        }
    }
    
    // MARK: - Constants

    let cornerRadius: CGFloat = 10.0
    let lineEdgeWidth: Int = 3
}
