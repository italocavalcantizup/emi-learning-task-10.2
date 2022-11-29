//
//  TreinosViewController.swift
//  LearningTask-10.2
//
//  Created by Italo cavalcanti on 23/11/22.
//

import UIKit

class TreinosViewController: UITableViewController {
    
    var treinosAPI: TreinosAPI?
    
    var treinos: [Treino] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        applyTheme()
        
        setupViews()
        loadTreinos()
    }
    
    func setupViews() {
        let titulo = "Seu protocolo de \ntreinos"
        tableView.tableHeaderView = DefaultTableHeaderView.build(with: titulo)
    }
    
    func loadTreinos() {
        guard let treinosAPI = treinosAPI else { return }
        treinos = treinosAPI.carregaTodos()
    }
    
}

// MARK: - Navigation related implementations
extension TreinosViewController {
    
    private enum Segues: String {
        case verDetalhesTreino = "verDetalhesTreinoSegue"
        case verFormNovoTreino = "verFormTreinoSegue"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let id = segue.identifier,
              let segueEsperada = Self.Segues(rawValue: id) else { return }
        
        switch segueEsperada {
        case .verDetalhesTreino:
            prepareForDetalhesTreino(segue, sender)
        case .verFormNovoTreino:
            prepareForFormNovoTreino(segue, sender)
        }
    }
    
    private func prepareForDetalhesTreino(_ segue: UIStoryboardSegue, _ sender: Any?) {
        guard let celula = sender as? TreinoViewCell,
              let controllerDestino = segue.destination as? DetalhesTreinoViewController else {
            fatalError("Não foi possível executar a segue \(segue.identifier!)")
        }
        
        controllerDestino.treino = celula.treino
    }
    
    private func prepareForFormNovoTreino(_ segue: UIStoryboardSegue, _ sender: Any?) {
        guard let controllerDestino = segue.destination as? NovoTreinoViewController else {
            fatalError("Não foi possível executar a segue \(segue.identifier!)")
        }
        
        controllerDestino.delegate = self
    }
    
}

// MARK: - NovoTreinoViewController delegation implementation
extension TreinosViewController: NovoTreinoViewControllerDelegate {
    func novoTreinoViewController(_ controller: NovoTreinoViewController, adicionou treino: Treino) {
        treinos.append(treino)
    }
}

// MARK: - UITableViewDataSouce implementations
extension TreinosViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return treinos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TreinoViewCell", for: indexPath) as? TreinoViewCell else {
            fatalError("Não foi possível obter célula para a lista de treinos")
        }
        
        cell.treino = treinos[indexPath.row]
        return cell
    }
}
