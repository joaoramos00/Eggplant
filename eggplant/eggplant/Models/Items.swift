//
//  Items.swift
//  eggplant
//
//  Created by João Luis Ferreira Ramos Junior on 07/04/22.
//

import Foundation
import UIKit

class Item: NSObject, NSCoding {
    
    let nome: String
    let calorias: Double
    
    let nomeString = "nome"
    let caloriasString = "calorias"
    
    init( nome: String, calorias: Double) {
        self.nome = nome
        self.calorias = calorias
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(nome, forKey: nomeString)
        coder.encode(calorias, forKey: caloriasString)
    }
    
    required init?(coder: NSCoder) {
        nome = coder.decodeObject(forKey: nomeString) as! String
        calorias = coder.decodeDouble(forKey: caloriasString)
        
    }
}
