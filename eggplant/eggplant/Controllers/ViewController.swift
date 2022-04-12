//
//  ViewController.swift
//  eggplant
//
//  Created by João Luis Ferreira Ramos Junior on 06/04/22.
//

import UIKit

protocol AdicionaRefeicaoDelegate {
    func add(_ refeicao: Refeicao)
}

class ViewController: UIViewController,
                      UITableViewDataSource,
                      UITableViewDelegate, AdicionaItemDelegate {
    
    
    // MARK: - Atributos
    
    var delegate: AdicionaRefeicaoDelegate?
    var itens: [Item] = []
    var itensSelecionados: [Item] = []
    
    let itensString = "itens"
    
    // MARK: - IBOutlets
    @IBOutlet var nomeTextField: UITextField?
    @IBOutlet weak var felicidadeTextField: UITextField?
    @IBOutlet weak var itensTableView: UITableView?
    
    
    // MARK: - IBActions
    @IBAction func adicionar(_ sender: Any) {
        
        if let refeicao = recuperaRefeicaoDoFormulario() {
        delegate?.add(refeicao)
        navigationController?.popViewController(animated: true)
        } else {
            Alerta(controller: self).exibe(msg: "Algo deu errado")
        }
    }

    //MARK: - View life cycle
    
    override func viewDidLoad() {
        let botaoAdicionaItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(adicionarItem))
        itens = ItemDao().load()
        navigationItem.rightBarButtonItem = botaoAdicionaItem
    }

    //MARK: - UITableViewDatraSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        celula.textLabel?.text = itens[indexPath.row].nome
        return celula
    }
    
    //MARK: - UITableVIewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let celula = tableView.cellForRow(at: indexPath) else { return }
        if celula.accessoryType == .none {
            celula.accessoryType = .checkmark
            
            itensSelecionados.append(itens[indexPath.row])

        } else {
            celula.accessoryType = .none
            let item = itens[indexPath.row]
            if let position = itensSelecionados.firstIndex(of: item){
                itensSelecionados.remove(at: position)
                for itemSelecionado in itensSelecionados {
                    print(  itemSelecionado.nome)
                }
            }

        }
    }
    //MARK: - Funcs
    func add(_ item: Item) {
        itens.append(item)
        if let tableView = itensTableView {
            tableView.reloadData()
        } else {
            Alerta(controller: self).exibe("Desculpe", msg: "não foi possivel carregar a tela")
        }
        ItemDao().save(itens)
    }

    func recuperaRefeicaoDoFormulario() -> Refeicao?     {
        guard let nomeDaRefeicao = nomeTextField?.text,
              let felicidadeDaRefeicao = felicidadeTextField?.text,
              let felicidade = Int(felicidadeDaRefeicao) else {
            return nil
        }
        return Refeicao(nome: nomeDaRefeicao, felicidade: felicidade, itens: itensSelecionados)
    }
    
    @objc func adicionarItem() {
        
        let adicionarItensViewController = AdicionarItensViewController(delegate: self)
        navigationController?.pushViewController(adicionarItensViewController, animated: true)
    }
    

    
}
