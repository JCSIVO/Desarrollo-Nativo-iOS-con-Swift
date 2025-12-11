//
//  GameModel.swift
//  who is that pokemon
//
//  Created by José Conejero Sivó on 11/11/25.
//

import Foundation

struct GameModel {
    var score = 0
    
    // Revisar respuesta correcta
    mutating func checkAnswer(_ userAnswer: String, _ correctAnswer: String) -> Bool {
        if userAnswer.lowercased() == correctAnswer.lowercased() {
            score += 1
            return true
        }
        return false
    }
    
    // Obtener Score
    func getScore() -> Int {
        return score
    }
    
    // Reiniciar Score
    mutating func setScore(score: Int) {
        self.score = score
    }
}
