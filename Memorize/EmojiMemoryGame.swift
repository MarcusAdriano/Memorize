//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Marcus Adriano on 01/07/20.
//  Copyright © 2020 Marcus Adriano. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame {    
    private var model: MemoryGame<String>
    
    init() {
        let emojis = ["🎃", "👻", "☠️"]
        model = MemoryGame<String>(numberOfPairs: emojis.count) { index in emojis[index]}
    }
    
    // - MARK: Access Model
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // - MARK: Intents
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    
    
}
