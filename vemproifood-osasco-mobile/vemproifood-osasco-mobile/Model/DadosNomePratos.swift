//
//  DadosNomePratos.swift
//  vemproifood-osasco-mobile
//
//  Created by Alexandre Gabassi on 21/11/18.
//  Copyright © 2018 Alexandre Gabassi. All rights reserved.
//

import Foundation

struct DadosNomePratos {
    var id: String? = ""
    var nomePrato: String? = ""
    
    func toDictionary() -> [String: Any] {
        var currentDictionary = [String: Any]()
        currentDictionary["id"] = id
        currentDictionary["nomePrato"] = nomePrato
        return currentDictionary
    }
}

class ListaNomeDosPratos {
    
    static let sharedListaNomeDosPratos = ListaNomeDosPratos()
    
    var listaNomes:[DadosNomePratos] = []
}
