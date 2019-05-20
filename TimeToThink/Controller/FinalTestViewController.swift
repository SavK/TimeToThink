//
//  FinalTestViewController.swift
//  TimeToThink
//
//  Created by Savonevich Constantine on 5/5/19.
//  Copyright © 2019 Savonevich Konstantin. All rights reserved.
//

import UIKit

class FinalTestViewController: UIViewController {
    // MARK: - IB Outlets
    @IBOutlet weak var backendView: UIView!
    @IBOutlet weak var resultLabel: UILabel!
    
    // MARK: -  Stored Properties
    /// Array of answers choosen by user
    var finalAnswers: [Answers]!
}

// MARK: - UIViewController Methods
extension FinalTestViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // customize backend view
        backendView.layer.cornerRadius = 10
        
        //output of the result
        updateResult()
    }
}

// MARK: - calculation of result
extension FinalTestViewController {
    func updateResult() {
        var frequencyOfAnswer = [AnswerType?: Int]()
        let finalResponseTypes = finalAnswers.map { $0.answerType }
        
        for response in finalResponseTypes {
            frequencyOfAnswer[response] = (frequencyOfAnswer[response] ?? 0) + 1
        }
        
        let frequencyOfAnswerSorted = frequencyOfAnswer.sorted(by: {$0.value > $1.value})
        guard let mostFrequentAnswer = frequencyOfAnswerSorted.first?.key else { return }
        
        outputResult(frequentAnswer: mostFrequentAnswer)
    }
    
    func outputResult(frequentAnswer: AnswerType) {
        resultLabel.text = frequentAnswer.definition
    }
}
