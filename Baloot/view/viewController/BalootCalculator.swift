//
//  BalootCalculator.swift
//  Baloot
//
//  Created by Mohammed Alsayed on 29/05/1443 AH.
//

import Foundation


enum ScoreType {
    case score
    case result
}

class Score {
    var lana: Int
    var lahm: Int
    var type: ScoreType
    
    init(lana: Int, lahm: Int, type: ScoreType) {
        self.lana = lana
        self.lahm = lahm
        self.type = type
    }
}


class BalootCalculator {
    static var result: [Score] = []
     
    
    
    static var currentScore: Score {
        if result.count == 0 {
            return Score(lana: 0, lahm: 0, type: .score)
        } else {
            return result.last!
        }
    }
    
    
    static var instance = BalootCalculator()
    //    static func total () -> Score{
    //
    //
    //        var lana = 0 , lahm = 0
    //        for x in result {
    //            lana += x.lana
    //            lahm += x.lahm
    //        }
    //        var score = Score (lana: lana, lahm: lahm, type: .score)
    //        return score
    //    }
    
    static func add(lana: Int, lahm: Int, isRedo: Bool = false) {
        if(result.count == 0) {
            let score = Score(lana: lana, lahm: lahm, type: .score)
            result.append(score)
        } else {
            let score = Score(lana: lana, lahm: lahm, type: .score)
            let lastScore = result.last!
            let resultScore = Score(lana: score.lana + lastScore.lana, lahm: score.lahm + lastScore.lahm, type: .result)
            
            result.append(score)
            result.append(resultScore)
            
        }
        
        
        func newSaka() {
            result = []
            
        }
    }
    func undo() {
        
        if(BalootCalculator.result.count == 0){
            return
        } else if BalootCalculator.result.count == 1 {
            BalootCalculator.result.append(BalootCalculator.result.last!)
            BalootCalculator.result.removeLast()
         } else {
             BalootCalculator.result.removeLast()
             BalootCalculator.result.append(BalootCalculator.result.last!)
             BalootCalculator.result.removeLast()
         }
         
     }
     
   
}
