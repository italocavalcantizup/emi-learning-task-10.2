//
//  TreinosViewController.swift
//  LearningTask-10.2
//
//  Created by Italo cavalcanti on 23/11/22.
//

import UIKit

class TreinosViewController: UITableViewController {
    
    var treinosAPI: TreinosAPI?

    override func viewDidLoad() {
        super.viewDidLoad()
        applyTheme()
        setupViews()
    }
    
    func setupViews() {
        let titulo = "Seu protocolo de \ntreinos"
        tableView.tableHeaderView = DefaultTableHeaderView.build(with: titulo)
    }
}

extension TreinosViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
