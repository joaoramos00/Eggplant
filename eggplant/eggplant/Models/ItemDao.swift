//
//  ItemDao.swift
//  eggplant
//
//  Created by João Luis Ferreira Ramos Junior on 12/04/22.
//

import Foundation

class ItemDao {
    
    let itensString = "itens"
    
    func save(_ itens: [Item]) {
        guard let caminho = recuperaCaminho() else { return }
        do {
            let dados = try NSKeyedArchiver.archivedData(withRootObject: itens, requiringSecureCoding: false)
            try dados.write(to: caminho)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func load() -> [Item] {
        guard let caminho = recuperaCaminho() else { return [] }
        do {
            let dados = try Data(contentsOf: caminho)
            let itensSalvos = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dados) as! Array<Item>
            return itensSalvos
        } catch {
            print(error.localizedDescription)
        }
        return []
    }
    
    func recuperaCaminho() -> URL? {
        guard let diretorio = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let caminho = diretorio.appendingPathComponent(itensString)
        return caminho
    }
}
