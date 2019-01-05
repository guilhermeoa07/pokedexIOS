//
//  ParserPokedex.swift
//  iDex
//
//  Created by guilherme oliveira andrade on 04/01/2019.
//  Copyright © 2019 Guilherme.Ol. All rights reserved.
//

import Foundation

typealias ParseReponseDict = [String: Any]?
typealias PokemonSpriteDict = [String: Any]

class ParsePokedex {
    func parseAllPokedex(response: [String: Any]?) -> PokedexModel {
        guard let response = response else { return PokedexModel() }
        
        let count = response["count"] as? Int ?? 0
        let next = response ["next"] as? String ?? ""
        let previous = response["previous"] as? String ?? ""
        
        let resultList = response["results"] as? [[String: Any]] ?? []
        let results = resultList.count
        
        return PokedexModel(count: count, next: next, previous: previous, results: results)
    }


    func parsePokemon(response: [String: Any]?) -> PokemonModel{
    
        guard let response = response else {return PokemonModel()}
    
        let name = response["name"] as? String ?? ""
        let id = response["id"] as? Int ?? 0
        let sprites = response["sprites"] as? [String: Any]
        let urlImage = sprites?["front_default"] as? String ?? ""
    
        return PokemonModel(id: id, name: name, urlImage: urlImage)
    }
}
