//
//  Grid.swift
//  Memorize
//
//  Created by Marcus Adriano on 13/07/20.
//  Copyright © 2020 Marcus Adriano. All rights reserved.
//

import SwiftUI

struct Grid<Item, ItemView>: View {
    private var items: [Item]
    private var viewForItem: (Item) -> ItemView
    
    init(items: [Item], _ viewForItem: @escaping (Item) -> ItemView) {
        self.items = items
        self.viewForItem = viewForItem
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}
