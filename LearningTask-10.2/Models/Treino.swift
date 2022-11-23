//
//  Treino.swift
//  LearningTask-10.2
//
//  Created by rafael.rollo on 04/08/2022.
//

import Foundation

// Exercicio tem simbolo, nome e descricao

struct Exercicio {
    var simbolo: String
    var nome: String
    var descricao: String
}

// Treino tem simbolo, titulo, descricao e exercícios

struct Treino {
    var simbolo: String
    var titulo: String
    var descricao: String
    var exercicios: [Exercicio]
}
