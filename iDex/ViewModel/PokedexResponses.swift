//
//  PokedexResponses.swift
//  iDex
//
//  Created by guilherme oliveira andrade on 04/01/2019.
//  Copyright © 2019 Guilherme.Ol. All rights reserved.
//

import Foundation

enum PokedexResponse {
    case sucess (model: PokedexModel)
    case serverError (description: ServerError)
    case timeOut (description: ServerError)
    case noConnection (description: ServerError)
}

enum PokemonResponse {
    case sucess (model: PokemonModel)
    case serverError (description: ServerError)
    case timeOut (description: ServerError)
    case noConnection (description: ServerError)
}

enum ImageResponse {
    case sucess (model: Data)
    case serverError (description: ServerError)
    case timeOut (description: ServerError)
    case noConnection (description: ServerError)
}

