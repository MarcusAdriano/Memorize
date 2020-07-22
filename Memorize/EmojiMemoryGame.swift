//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Marcus Adriano on 01/07/20.
//  Copyright © 2020 Marcus Adriano. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createGame()
    
    private static func createGame() -> MemoryGame<String> {
        //let emojis = ["🎃", "👻", "🕷", "🦄", "🕸"]
        let emojis = ["🎃", "👻", "🕷"]
        return MemoryGame<String>(numberOfPairs: emojis.count) { index in
            return emojis[index]
        }
    }
    
    // MARK: - Access Model
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intent(s)
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    
    func resetGame() {
        model = EmojiMemoryGame.createGame()
    }
    
    
}
