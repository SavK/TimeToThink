//
//  CollectionViewCell.swift
//  TimeToThink
//
//  Created by Savonevich Constantine on 5/5/19.
//  Copyright © 2019 Savonevich Konstantin. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var emoji: UILabel!
    @IBOutlet weak var nameOfQuestion: UILabel!
    @IBOutlet weak var nameOfCountQuestions: UILabel!
    
    // load data into cell from Menu.swift
    var menu: Menu? {
        didSet {
            
            // resize labels relative to screen size
            if (self.bounds.width * 2) + (3 * 20) > 320 {
                emoji.font = UIFont(name: nameOfQuestion.font.fontName,
                                    size: 65)
                nameOfQuestion.font = UIFont(name: nameOfQuestion.font.fontName,
                                             size: 17)
                nameOfCountQuestions.font = UIFont(name: nameOfCountQuestions.font.fontName,
                                                   size: 11)
            }
            
            emoji.text = menu?.emoji
            nameOfQuestion.text = menu?.nameOfQuestion
            if var name = menu?.nameOfCountQuestions {
                name += "\(menu?.countOfQuestions ?? 0)"
                nameOfCountQuestions.text = name
            }
        }
    }
}
