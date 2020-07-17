//
//  Cardify.swift
//  Memorize
//
//  Created by Marcus Adriano on 16/07/20.
//  Copyright © 2020 Marcus Adriano. All rights reserved.
//

import SwiftUI

struct Cardify: ViewModifier {
    var isFaceUp: Bool
    
    func body(content: Content) -> some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: lineEdgeWidth)
                content
            } else {
                RoundedRectangle(cornerRadius: cornerRadius).fill()
            }
        }
    }
    
    // MARK: - Constants
    private let cornerRadius: CGFloat = 10.0
    private let lineEdgeWidth: CGFloat = 3
}

// MARK: - View Extension
extension View {
    func cardify(isFaceUp: Bool) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
