//
//  DetalhesTreinoViewController.swift
//  LearningTask-10.2
//
//  Created by Italo cavalcanti on 28/11/22.
//

import UIKit

class DetalhesTreinoViewController: UITableViewController {
    
    var treino: Treino!

    override func viewDidLoad() {
        super.viewDidLoad()
        applyTheme()
        setupViews()
    }
    
    func setupViews() {
        tableView.tableHeaderView = DetailsTableHeaderView.build(from: treino)
        
        tableView.register(DefaultTableSectionHeaderView.self, forHeaderFooterViewReuseIdentifier: DefaultTableSectionHeaderView.reuseId)
        tableView.sectionHeaderHeight = DefaultTableSectionHeaderView.alturaBase
        tableView.sectionHeaderTopPadding = 0
    }
}

// MARK: - UITableViewDataSource related code
extension DetalhesTreinoViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return treino.exercicios.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ExercicioViewCell", for: indexPath) as? ExercicioViewCell else {
            fatalError("Não foi possível obter a célula para a lista de exercícios")
        }
        cell.exercicio = treino.exercicios[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: DefaultTableSectionHeaderView.reuseId) as? DefaultTableSectionHeaderView else {
            fatalError("Não foi possível recuperar header view para o titulo de seção em DetalhesRefeicao")
        }
        header.titulo = "Exercícios"
        return header
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
