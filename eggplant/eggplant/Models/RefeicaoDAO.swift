//
//  RefeicaoDAO.swift
//  eggplant
//
//  Created by João Luis Ferreira Ramos Junior on 12/04/22.
//

import Foundation

class RefeicaoDAO {
    
    let refeitcaoString = "refeicao"

    
    func save(_ refeicoes: [Refeicao]) {
        print("entrou aqui")
        guard let caminho = recuperaCaminho() else {
            print("Entrou aqui")
            return }
        
        do {
            let dados = try NSKeyedArchiver.archivedData(withRootObject: refeicoes, requiringSecureCoding: false)
            try dados.write(to: caminho)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func load() -> [Refeicao] {
        guard let caminho = recuperaCaminho() else { return [] }
        
        do {
            let dados = try Data(contentsOf: caminho)
            guard let refeicoesSalvas = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dados) as? Array<Refeicao> else { return [] }
            return refeicoesSalvas
        } catch {
            print(error.localizedDescription)
        }
        return []
    }
    
    func recuperaCaminho() -> URL? {
        guard let diretorio = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            print("Parou aqui")
            return nil }
        let caminho = diretorio.appendingPathComponent(refeitcaoString)
        print(caminho)
        return caminho
    }
    
}
