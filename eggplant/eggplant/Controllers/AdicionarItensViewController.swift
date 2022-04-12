//
//  AdicionarItensViewController.swift
//  eggplant
//
//  Created by João Luis Ferreira Ramos Junior on 07/04/22.
//

import UIKit

protocol AdicionaItemDelegate {
    func add(_ item: Item)
}

class AdicionarItensViewController: UIViewController {

    
    //MARK: - IBOutlets
    
    @IBOutlet weak var itemNome: UITextField!
    @IBOutlet weak var itemCalorias: UITextField!

    
    //MARK: - Atributos
    var delegate: AdicionaItemDelegate?
    
    init (delegate: AdicionaItemDelegate) {
        super.init(nibName: "AdicionarItensViewController", bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //MARK: - View life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: IBAction
    @IBAction func adicionarItem(_ sender: Any) {
        guard  let nome = itemNome.text, let calorias = itemCalorias.text else { return }
        if let doubleCalorias = Double(calorias) {
            let item = Item(nome: nome, calorias: doubleCalorias)
            delegate?.add(item)
            navigationController?.popViewController(animated: true)
        }
    }
}
