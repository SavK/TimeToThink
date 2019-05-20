//
//  CollectionViewCell.swift
//  TimeToThink
//
//  Created by Savonevich Constantine on 5/5/19.
//  Copyright © 2019 Savonevich Konstantin. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    // MARK: - IB Outlets
    @IBOutlet weak var emoji: UILabel!
    @IBOutlet weak var nameOfTest: UILabel!
    @IBOutlet weak var countOfQuestions: UILabel!
    
    // load data into cell from Menu.swift
    var menu: Menu? {
        didSet {
            
            // resize labels relative to screen size
            if (self.bounds.width * 2) + (3 * 20) > 320 {
                emoji.font = UIFont(name: nameOfTest.font.fontName,
                                    size: 65)
                nameOfTest.font = UIFont(name: nameOfTest.font.fontName,
                                             size: 17)
                countOfQuestions.font = UIFont(name: countOfQuestions.font.fontName,
                                               size: 11)
            }
            
            emoji.text = menu?.emoji
            nameOfTest.text = menu?.nameOfTest
            countOfQuestions.text = "ВОПРОСОВ: \(menu?.countOfQuestions ?? 0)"
        }
    }
}
