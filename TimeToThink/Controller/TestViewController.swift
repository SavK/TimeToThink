//
//  TestViewController.swift
//  TimeToThink
//
//  Created by Savonevich Constantine on 5/5/19.
//  Copyright © 2019 Savonevich Konstantin. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var currentInfoLabel: UILabel!
    @IBOutlet weak var questionProgressView: UIProgressView!
    
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet var singleButtons: [UIButton]!
    
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet var multipleButtons: [UIButton]!
    @IBOutlet weak var multiAnswerButton: UIButton!
    @IBOutlet var multipleLabels: [UILabel]!
    
    @IBOutlet weak var rangedStackView: UIStackView!
    @IBOutlet weak var rangedSlider: UISlider!
    @IBOutlet var rangedLabels: [UILabel]!
    @IBOutlet weak var rangedAnswerButton: UIButton!
    
    // MARK: -  Stored Properties
    /// answers choosen by user
    var answersChoosen = [Answers]()
    /// index of question at current Test
    var currentTestQuestionIndex = 1
    /// count of question at current Test
    var questionCount = 0
    /// index of current test
    var currentTestIndex = 0
    /// index of current question
    var questionIndex = 0
    
    // count of questions for all tests
    let countCarQuestions = SelectedTestType.car.countOfQuestions
    let countSportQuestions = SelectedTestType.sport.countOfQuestions
    let countAnimalQuestions = SelectedTestType.animal.countOfQuestions
    let countPizzaQuestions = SelectedTestType.pizza.countOfQuestions
    
}

// MARK: - IB Actions
extension TestViewController {
    
    @IBAction func multiselectButtonPressed(sender: UIButton) {
        if sender.isSelected {
            sender.setImage( UIImage(named:"unchecked.png"), for: .normal)
            sender.isSelected = false
        } else {
            sender.setImage(UIImage(named:"checked.png"), for: .normal)
            sender.isSelected = true
        }
    }
    
    @IBAction func singleAnswerButtonPressed(sender: UIButton) {
        guard let currentAnswers = Questions.loadData()[questionIndex].answers else { return }
        guard let buttonIndex = singleButtons.firstIndex(of: sender) else { return }
        let answer = currentAnswers[buttonIndex]
        answersChoosen.append(answer)
        
        nextQuestion()
    }
    
    @IBAction func multiAnswerButtonPressed(sender: UIButton) {
        guard let currentAnswers = Questions.loadData()[questionIndex].answers else { return }
        for (button, answer) in zip(multipleButtons, currentAnswers) {
            if button.isSelected {
                answersChoosen.append(answer)
            }
        }
        nextQuestion()
    }
    
    @IBAction func rengedAnswerButtonPressed(sender: UIButton) {
        guard let currentAnswers = Questions.loadData()[questionIndex].answers else { return }
        let index = Int(round(rangedSlider.value * Float(currentAnswers.count - 1)))
        answersChoosen.append(currentAnswers[index])
        
        nextQuestion()
    }
}

// MARK: - Next question state, Navigation
extension TestViewController {
    // show next question or finish screen
    func nextQuestion() {
        questionIndex += 1
        currentTestQuestionIndex += 1
        
        if currentTestQuestionIndex <= questionCount {
            // update User Interface
            updateUI()
        } else {
            performSegue(withIdentifier: "finalTestSegue", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "finalTestSegue" else { return }
        guard let finalTestVC = segue.destination as? FinalTestViewController else { return }
        finalTestVC.finalAnswers = answersChoosen
    }
}

// MARK: - UIViewController Methods
extension TestViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // customize selected buttons in multiple stack view
        for button in multipleButtons {
            button.setImage(UIImage(named: "unchecked"), for: .normal)
            button.setImage(UIImage(named: "checked"), for: .selected)
        }
        // customize buttons in single stack view
        for button in singleButtons {
            button.layer.cornerRadius = 10
            button.tintColor = .white
            button.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        }
        // customize answer buttons in multi & ranged stack views
        rangedAnswerButton.layer.cornerRadius = 10
        multiAnswerButton.layer.cornerRadius = 10
        
        // update User Interface & correct values
        correctCurrentValues()
        updateUI()
    }
}

// MARK: - User Interface
extension TestViewController {
    
    func updateUI() {
        for stackView in [singleStackView, multipleStackView, rangedStackView] {
            stackView?.isHidden = true
        }
        
        let currentQuestion = Questions.loadData()[questionIndex]
        guard let currentAnswers = currentQuestion.answers else { return }
        
        // set progress for questionProgressView
        let totalProgress = Float(currentTestQuestionIndex - 1) / Float(questionCount)
        questionProgressView.setProgress(totalProgress, animated: true)
        
        // set current info of selected question
        currentInfoLabel.text = "ВОПРОС \(currentTestQuestionIndex) ИЗ \(questionCount)"
        questionLabel.text = currentQuestion.text
        
        // show type of question
        switch currentQuestion.responseType {
        case .single:
            updateSingleStackView(using: currentAnswers)
        case .multiple:
            updateMultipleStackView(using: currentAnswers)
        case .ranged:
            updateRangedStackView(using: currentAnswers)
        }
    }
    
    // correct values for selected test
    func correctCurrentValues() {
        switch self.currentTestIndex {
        case 1:
            questionCount = countSportQuestions
            questionIndex += countCarQuestions
        case 2:
            questionCount = countAnimalQuestions
            questionIndex = countCarQuestions + countSportQuestions
        case 3:
            questionCount = countPizzaQuestions
            questionIndex = Questions.loadData().count - questionCount
        default:
            questionCount = countCarQuestions
        }
    }
    
    /// Setup single stack view
    ///
    /// - Parameter answers: [Answers] - array with answers
    func updateSingleStackView(using answers:[Answers]) {
        singleStackView.isHidden = false
        
        for (button, answer) in zip(singleButtons, answers){
            button.setTitle(answer.text, for: [])
        }
    }
    
    /// Setup multiple stack view
    ///
    /// - Parameter answers: [Answers] - array with answers
    func updateMultipleStackView(using answers:[Answers]) {
        multipleStackView.isHidden = false
        for (label, answer) in zip (multipleLabels, answers) {
            label.text = answer.text
        }
    }
    
    /// Setup ranged stack view
    ///
    /// - Parameter answers: [Answers] - array with answers
    func updateRangedStackView(using answers:[Answers]) {
        rangedStackView.isHidden = false
        
        rangedLabels.first?.text = answers.first?.text
        rangedLabels.last?.text = answers.last?.text
    }
}
