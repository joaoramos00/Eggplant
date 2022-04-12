//
//  Refeicao.swift
//  eggplant
//
//  Created by João Luis Ferreira Ramos Junior on 07/04/22.
//

import Foundation
import UIKit

class Refeicao: NSObject, NSCoding {
    
    let nome: String
    let felicidade: Int
    var itens: Array<Item> = []
    
    let itensString = "itens"
    let nomeString = "nome"
    let felicidadeString = "felicidade"
    
    init(nome: String, felicidade: Int, itens: [Item] = []) {
        self.nome = nome
        self.felicidade = felicidade
        self.itens = itens
    }
    
    //MARK: - NSconding
    
    func encode(with coder: NSCoder) {
        coder.encode(nome, forKey: nomeString)
        coder.encode(felicidade, forKey: felicidadeString)
        coder.encode(itens, forKey: itensString)
        
    }
    
    required init?(coder: NSCoder) {
        nome = coder.decodeObject(forKey: nomeString) as! String
        felicidade = coder.decodeInteger(forKey: felicidadeString)
        itens = coder.decodeObject(forKey: itensString  ) as! Array<Item>
    }
    
    func totalDeCalorias() -> Double {
        var total = 0.0
        for item in itens {
            total += item.calorias
        }
        return total
    }
    
    func detalhes() -> String {
        var msg = "Felicidade: \(felicidade)"
        for item in itens {
            msg += ", \(item.nome) - calorias: \(item.calorias)"
        }
        return msg
    }
}
