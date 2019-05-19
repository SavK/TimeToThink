//
//  Menu.swift
//  TimeToThink
//
//  Created by Savonevich Constantine on 5/5/19.
//  Copyright © 2019 Savonevich Konstantin. All rights reserved.
//

struct Menu {
    var emoji: String?
    var nameOfTest: String?
    var countOfQuestions: Int?
}

extension Menu {
    static func loadData() -> [Menu] {
        return [
            Menu(emoji: "🚗",
                 nameOfTest: "Какое авто тебе подходит?",
                 countOfQuestions: SelectedTestType.car.countOfQuestions
            ),
            Menu(emoji: "💪",
                 nameOfTest: "Какой вид спорта - твой?",
                 countOfQuestions: SelectedTestType.sport.countOfQuestions
            ),
            Menu(emoji: "🦁",
                 nameOfTest: "Кто ты из мира животных?",
                 countOfQuestions: SelectedTestType.animal.countOfQuestions
            ),
            Menu(emoji: "🍕",
                 nameOfTest: "Какая твоя любимая пицца?",
                 countOfQuestions: SelectedTestType.pizza.countOfQuestions
            )
        ]
    }
}
