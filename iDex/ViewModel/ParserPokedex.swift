//
//  ParserPokedex.swift
//  iDex
//
//  Created by guilherme oliveira andrade on 04/01/2019.
//  Copyright © 2019 Guilherme.Ol. All rights reserved.
//

import Foundation

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
}
