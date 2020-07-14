//
//  Array+Only.swift
//  Memorize
//
//  Created by Marcus Adriano on 14/07/20.
//  Copyright © 2020 Marcus Adriano. All rights reserved.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
