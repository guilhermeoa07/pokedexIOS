//
//  RequestPokedex.swift
//  iDex
//
//  Created by guilherme oliveira andrade on 04/01/2019.
//  Copyright © 2019 Guilherme.Ol. All rights reserved.
//

import Foundation
import Alamofire

struct PokemonAPIURL {
    static let Main: String = "http://pokeapi.co/api/v2/pokemon/"
}

class RequestPokedex {
    
    let alamofireManager: SessionManager = {
        let config = URLSessionConfiguration.default
        //define o tempo de timeout em milisegundos
        config.timeoutIntervalForRequest = 10000
        config.timeoutIntervalForResource = 10000
        return SessionManager(configuration: config)
    }()
    
    let parse: ParsePokedex = ParsePokedex()
    
    func getAllPokemons(url:String?, completion:@escaping (_ response: PokedexResponse) -> Void)
    {
        
        let page = url == "" || url == nil ? PokemonAPIURL.Main : url!
        
        alamofireManager.request(page, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON
            {
            (response) in
            
            //Pegar o Status
            let statusCode = response.response?.statusCode
            switch response.result
            {
            case .success(let value):
                //Json de retorno
                let resultValue = value as? [String:Any]
                if statusCode == 404
                {
                    if let description = resultValue?["detail"] as? String
                    {
                        let error = ServerError (description: description, errorCode: statusCode!)
                        completion(.serverError(description: error))
                    }
                }
                else if statusCode == 200
                {
                    let model = self.parse.parseAllPokedex(response: resultValue)
                    completion(.sucess(model: model))
                }
            case .failure(let error):
                let errorCode = error._code
                if errorCode == -1009
                {
                    let error = ServerError(description: error.localizedDescription, errorCode: errorCode)
                    completion(.noConnection(description: error))
                }
            }
           
        }
    }
    
}



