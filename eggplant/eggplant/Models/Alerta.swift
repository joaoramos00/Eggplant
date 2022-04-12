//
//  Alerta.swift
//  eggplant
//
//  Created by João Luis Ferreira Ramos Junior on 08/04/22.
//

import Foundation
import UIKit


class Alerta {
    
    let controller: UIViewController
    
    init(controller:UIViewController) {
        self.controller = controller
    }
    
    func exibe(_ titulo: String = "Desculpe", msg:String = "Algum erro ocorreu") {
        let alerta = UIAlertController(title: titulo, message: msg, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alerta.addAction(ok)
        controller.present(alerta, animated: true, completion: nil)
    }
}
