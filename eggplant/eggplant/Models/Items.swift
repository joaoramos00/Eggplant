//
//  Items.swift
//  eggplant
//
//  Created by João Luis Ferreira Ramos Junior on 07/04/22.
//

import Foundation
import UIKit

class Item: NSObject {
    
    let nome: String
    let calorias: Double
    
    init( nome: String, calorias: Double) {
        self.nome = nome
        self.calorias = calorias
    }
}
