//
//  CellManager.swift
//  TimeToThink
//
//  Created by Savonevich Constantine on 7/27/19.
//  Copyright © 2019 Savonevich Konstantin. All rights reserved.
//

import Foundation

/// Configure cells
class CellManager {
    static func configure(_ cell: CollectionViewCell, with menu: Menu?) {
        guard let menu = menu else { return }
        
        cell.emoji.text = menu.emoji
        cell.nameOfTest.text = menu.nameOfTest
        cell.countOfQuestions.text = "ВОПРОСОВ: \(menu.countOfQuestions ?? 0)"
        
        cell.correctFontSize()
    }
}
