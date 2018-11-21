//
//  ConsultaServicos.swift
//  vemproifood-osasco-mobile
//
//  Created by Alexandre Gabassi on 21/11/18.
//  Copyright © 2018 Alexandre Gabassi. All rights reserved.
//

import Foundation

import SwiftyJSON

class chamadosRequests {
    
    typealias CompletionHandler = (_ success:Bool) -> Void
    
    do {
        if let file = Bundle.main.url(forResource: "DadosNomesPratos", withExtension: "json") {
        let data = try Data(contentsOf: file)
    
    listaNomes.listaNomes.removeAll()
    
    let jsonCards = JSON(data)
    for (_, channelInfo) in jsonCards["canaisMokados"] {
    
    if channelInfo[strTipoCanalAtendimentoID].exists() {
    
    var dados = DadosCanalAtendimento()
    
    dados.id = channelInfo[strTipoCanalAtendimentoID].object as? String
    
    dados.categorization = channelInfo["categorizationDisplay"].object as? String
    
    dados.orientation = channelInfo["orientation"].object as? String
    
    dados.attachmentOrientation = channelInfo["attachmentOrientation"].object as? String
    
    for properties in channelInfo["properties"].arrayValue {
    
    var dadosProperties = DadosPropertiesCanalAtendimento()
    dadosProperties.name = properties["name"].object as? String
    dadosProperties.description = properties["description"].object as? String
    dadosProperties.sample = properties["sample"].object as? String
    dadosProperties.type = properties["type"].object as? Int
    dadosProperties.sequency = properties["sequency"].object as? Int
    dadosProperties.isRequired = properties["isRquired"].object as? Bool
    dadosProperties.values = (properties["values"].object as? [String])!
    
    dados.properties.append(dadosProperties)
    }
    //                        canaisMokados.listaCanais.append(dados)
    canaisAtendimento.listaCanais.append(dados)
    }
    }
    completionHandler(true)
    }
    } catch {
    print(error.localizedDescription)
    }
}
}

