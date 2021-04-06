//
//  TipsyBrain.swift
//  Tipsy
//
//  Created by Ilya on 06.04.2021.
//

import UIKit


struct TipsyBrain {
    
    
    func doubleTips(tips: String) -> Double {
        let tipValue = tips.dropLast()
        let doubleTip = Double(tipValue) ?? 0.0
        return doubleTip
    }
    
    
    func billValue(bill: Double, tip: Double, split: Int) -> Double {
        
        if tip == 0.0 {
            return bill / Double(split)
        } else {
           return bill * (1 + tip) / Double(split)
        }
    }
}
