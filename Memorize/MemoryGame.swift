//
//  MemoryGame.swift
//  Memorize
//
//  Created by Marcus Adriano on 01/07/20.
//  Copyright © 2020 Marcus Adriano. All rights reserved.
//

import Foundation

struct MemoryGame<GameContent> {    
    var cards: Array<Card> = Array()
    
    init(numberOfPairs: Int, contentFactory: (Int) -> GameContent) {
        for index in 0..<numberOfPairs {
            let content = contentFactory(index)
            cards.append(Card(id: index * 2, content: content))
            cards.append(Card(id: index * 2 + 1, content: content))
        }
    }
    
    mutating func choose(card: Card) {
        let chosenIndex = self.cards.firstIndex(matching: card)!
        self.cards[chosenIndex].isFaceUp = !self.cards[chosenIndex].isFaceUp
    }
    
    struct Card: Identifiable {
        var id: Int
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: GameContent
    }
    
}
