//
//  ExercicioViewCell.swift
//  LearningTask-10.2
//
//  Created by Italo cavalcanti on 28/11/22.
//

import UIKit

class ExercicioViewCell: UITableViewCell {

    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var descricaoLabel: UILabel!
    @IBOutlet weak var simboloLabel: UILabel!
    
    var exercicio: Exercicio? {
        didSet {
            guard let exercicio = exercicio else { return }
            nomeLabel.text = exercicio.nome
            descricaoLabel.text = exercicio.descricao
            simboloLabel.text = exercicio.simbolo
        }
    }
    
}
