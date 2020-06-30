//
//  ContentView.swift
//  Memorize
//
//  Created by Marcus Adriano on 30/06/20.
//  Copyright © 2020 Marcus Adriano. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack(content: {
            ForEach(0..<4, content: {index in
                CardView()
            })
        })
        .padding()
        .foregroundColor(Color.orange)
        .font(Font.largeTitle)
    }
}

struct CardView: View {
    
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack(content: {
            if (isFaceUp) {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.orange)
            } else {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                Text("👻")
            }
            })
            .onTapGesture {
                self.click()
            }
    }
    
    private func click() {
        isFaceUp = !isFaceUp
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
