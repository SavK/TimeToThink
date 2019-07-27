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
    @IBOutlet weak var emojiNC: UIButton!
    @IBOutlet weak var questionProgressView: UIProgressView!
    /// Single type
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet var singleButtons: [UIButton]!
    /// Multiple type
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet var multipleButtons: [UIButton]!
    @IBOutlet weak var multiAnswerButton: UIButton!
    @IBOutlet var multipleLabels: [UILabel]!
    /// Ranged type
    @IBOutlet weak var rangedStackView: UIStackView!
    @IBOutlet weak var rangedSlider: UISlider!
    @IBOutlet var rangedLabels: [UILabel]!
    @IBOutlet weak var rangedAnswerButton: UIButton!
    
    // MARK: -  Stored Properties
    /// Answers choosen by user
    var answersChoosen = [Answers]()
    /// Index of question at current Test
    var currentTestQuestionIndex = 1
    /// Count of question at current Test
    var questionCount = 0
    /// Index of current test
    var currentTestIndex = 0
    /// Index of current question
    var questionIndex = 0
    
    /// Count of questions for all tests
    let countCarQuestions = SelectedTestType.car.countOfQuestions
    let countSportQuestions = SelectedTestType.sport.countOfQuestions
    let countAnimalQuestions = SelectedTestType.animal.countOfQuestions
    let countPizzaQuestions = SelectedTestType.pizza.countOfQuestions
    
    // MARK: - Model declaration
    var menu: Menu?
    
    // MARK: - UIViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// Customize selected buttons in multiple stack view
        for button in multipleButtons {
            button.setImage(UIImage(named: "uncheckedBox80pt"), for: .normal)
            button.setImage(UIImage(named: "checkedBox80pt"), for: .selected)
        }
        /// Customize buttons in single stack view
        for button in singleButtons {
            button.layer.cornerRadius = 10
            button.tintColor = .white
            button.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        }
        /// Customize labels in ranged stack view
        for label in rangedLabels {
            label.font = UIFont(name: label.font.fontName, size: 35)
        }
        
        /// Customize answer buttons in multi & ranged stack views
        rangedAnswerButton.layer.cornerRadius = 10
        multiAnswerButton.layer.cornerRadius = 10
        
        /// Update User Interface & correct values
        correctCurrentValues()
        updateUI()
        
        /// Update Navigation Controller
        self.title = menu?.nameOfTest
        emojiNC.setTitle(menu?.emoji, for: .normal)
    }
}

// MARK: - IB Actions
extension TestViewController {
    
    @IBAction func multiselectButtonPressed(sender: UIButton) {
        if sender.isSelected {
            sender.setImage( UIImage(named:"uncheckedBox80pt"), for: .normal)
            sender.isSelected = false
        } else {
            sender.setImage(UIImage(named:"checkedBox80pt"), for: .normal)
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
    
    /// Show next question or finish screen
    func nextQuestion() {
        questionIndex += 1
        currentTestQuestionIndex += 1
        
        if currentTestQuestionIndex <= questionCount {
            /// Update User Interface
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

// MARK: - User Interface
extension TestViewController {
    
    func updateUI() {
        for stackView in [singleStackView, multipleStackView, rangedStackView] {
            stackView?.isHidden = true
        }
        
        let currentQuestion = Questions.loadData()[questionIndex]
        guard let currentAnswers = currentQuestion.answers else { return }
        
        /// Set progress for questionProgressView
        let totalProgress = Float(currentTestQuestionIndex - 1) / Float(questionCount)
        questionProgressView.setProgress(totalProgress, animated: true)
        
        /// Set current info of selected question
        currentInfoLabel.text = "ВОПРОС \(currentTestQuestionIndex) ИЗ \(questionCount)"
        questionLabel.text = currentQuestion.text
        
        /// Show type of question
        switch currentQuestion.responseType {
        case .single:
            updateSingleStackView(using: currentAnswers)
        case .multiple:
            updateMultipleStackView(using: currentAnswers)
        case .ranged:
            updateRangedStackView(using: currentAnswers)
        }
    }
    
    /// Correct values for selected test
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
        for button in multipleButtons {
            button.isSelected = false
            button.setImage(UIImage(named: "uncheckedBox80pt"), for: .normal)
        }
    }
    
    /// Setup ranged stack view
    ///
    /// - Parameter answers: [Answers] - array with answers
    func updateRangedStackView(using answers:[Answers]) {
        rangedStackView.isHidden = false
        
        rangedSlider.value = rangedSlider.maximumValue / 2
        rangedLabels.first?.text = answers.first?.text
        rangedLabels.last?.text = answers.last?.text
    }
}
