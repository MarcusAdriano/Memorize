//
//  MemoryGame.swift
//  Memorize
//
//  Created by Marcus Adriano on 01/07/20.
//  Copyright © 2020 Marcus Adriano. All rights reserved.
//

import Foundation

struct MemoryGame<GameContent> {
    
    var cards: Array<Card>
    
    func choose(card: Card) {
        print("Card was choosen: \(card)")
    }
    
    struct Card {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: GameContent
    }
    
}
