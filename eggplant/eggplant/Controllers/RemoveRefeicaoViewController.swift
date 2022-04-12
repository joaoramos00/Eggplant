//
//  RemoveRefeicaoViewController.swift
//  eggplant
//
//  Created by João Luis Ferreira Ramos Junior on 11/04/22.
//

import Foundation
import UIKit

class RemoveRefeicaoViewController {
    
    let controller: UIViewController
    init (controller: UIViewController){
        self.controller = controller
    }
    
    func exibe(_ refeicao: Refeicao, handler: @escaping (UIAlertAction) -> Void) {
        let alerta = UIAlertController(title: refeicao.nome, message: refeicao.detalhes(), preferredStyle:.alert )
        
        //MARK: - declaração de botões do alerta
        
        let botaoCancelar = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        let botaoRemover = UIAlertAction(title: "Remover", style: .destructive, handler: handler)

        alerta.addAction(botaoCancelar)
        alerta.addAction(botaoRemover)
        controller.present(alerta, animated: true, completion: nil)
        
    }
}
