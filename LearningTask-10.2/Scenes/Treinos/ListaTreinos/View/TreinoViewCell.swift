//
//  TreinosViewCell.swift
//  LearningTask-10.2
//
//  Created by Italo cavalcanti on 28/11/22.
//

import UIKit

class TreinoViewCell: UITableViewCell {

    @IBOutlet private weak var simboloLabel: UILabel!
    @IBOutlet private weak var tituloLabel: UILabel!
    @IBOutlet private weak var descricaoLabel: UILabel!
    
    var treino: Treino? {
        didSet {
            guard let treino = treino else { return }
            simboloLabel.text = treino.simbolo
            tituloLabel.text = treino.titulo
            descricaoLabel.text = treino.descricao
        }
    }
}
