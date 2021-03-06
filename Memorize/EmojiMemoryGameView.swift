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
        VStack {
            Grid(items: viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    withAnimation(.linear(duration: 0.5)) {
                        self.viewModel.choose(card: card)
                    }
                }
                    .padding(5)
            }
                .padding()
                .foregroundColor(Color.orange)
            Button(action: {
                withAnimation(.easeInOut) {
                   self.viewModel.resetGame()
                }
            }, label: { Text("New Game") })
        }
    }
}
// MARK: - CardView
struct CardView: View {    
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    @State private var animatedBonusRamaining: Double = 0
    
    private func startBonusTimeAnimation() {
        animatedBonusRamaining = card.bonusRemaining
        withAnimation(.linear(duration: card.bonusTimeRemaining)) {
            animatedBonusRamaining = 0
        }
    }
    
    @ViewBuilder
    private func body(for size: CGSize) -> some View {
        if card.isFaceUp || !card.isMatched {
            ZStack {
                Group {
                    if card.isConsumingBonusTime {
                        Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: -animatedBonusRamaining*360-90), clockwise: true)
                            .onAppear {
                                self.startBonusTimeAnimation()
                            }
                    } else {
                        Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: -card.bonusRemaining*360-90), clockwise: true)
                    }
                }
                    .opacity(0.4)
                    .padding(5)
                Text(card.content)
                    .font(Font.system(size: fontSize(for: size)))
                    .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
                    .animation(card.isMatched ? Animation.linear(duration: 1).repeatForever(autoreverses: false) : .default)
            }
            .cardify(isFaceUp: card.isFaceUp)
            .transition(AnyTransition.scale)
        }
    }
    
    // MARK: - Constants

    private func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.75
    }
}

// MARK: - Previews
struct EmojiMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(card: game.cards[2])
        return EmojiMemoryGameView(viewModel: game)
    }
}
