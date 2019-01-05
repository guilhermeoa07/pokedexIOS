//
//  PokedexModel.swift
//  iDex
//
//  Created by guilherme oliveira andrade on 04/01/2019.
//  Copyright © 2019 Guilherme.Ol. All rights reserved.
//

import Foundation

struct PokedexModel {
    let count:Int
    let next: String
    let previous: String
    let results:Int
}
extension PokedexModel{
    init() {
        self.count = 0
        self.next = ""
        self.previous = ""
        self.results = 0
    }
}
