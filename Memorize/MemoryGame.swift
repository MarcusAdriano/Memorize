//
//  MemoryGame.swift
//  Memorize
//
//  Created by Marcus Adriano on 01/07/20.
//  Copyright © 2020 Marcus Adriano. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    var cards: Array<Card> = Array()
    var indexOfTheOneAndOnlyFaceUpCard: Int?
    
    init(numberOfPairs: Int, contentFactory: (Int) -> CardContent) {
        for index in 0..<numberOfPairs {
            let content = contentFactory(index)
            cards.append(Card(id: index * 2, content: content))
            cards.append(Card(id: index * 2 + 1, content: content))
        }
    }
    
    mutating func choose(card: Card) {
        if let chosenIndex = self.cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                indexOfTheOneAndOnlyFaceUpCard = nil
            } else {
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
            self.cards[chosenIndex].isFaceUp = true
        }
        
    }
    
    struct Card: Identifiable {
        var id: Int
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
    
}
