//
//  PokemonModel.swift
//  iDex
//
//  Created by guilherme oliveira andrade on 04/01/2019.
//  Copyright © 2019 Guilherme.Ol. All rights reserved.
//

import Foundation

struct PokemonModel {
    var id: Int
    var name: String
    var urlImage: String
}

extension PokemonModel{
    init() {
        self.id = 0
        self.name = ""
        self.urlImage = ""
    }
}
