//
//  Menu.swift
//  TimeToThink
//
//  Created by Savonevich Constantine on 5/5/19.
//  Copyright © 2019 Savonevich Konstantin. All rights reserved.
//

struct Menu {
    var emoji: String?
    var nameOfQuestion: String?
    var nameOfCountQuestions: String?
    var countOfQuestions: Int?
}

extension Menu {
    static func loadData() -> [Menu] {
        return [
            Menu(emoji: "🚗",
                 nameOfQuestion: "Какое авто тебе подходит?",
                 nameOfCountQuestions: "ВОПРОСОВ: ",
                 countOfQuestions: 10
            ),
            Menu(emoji: "🤼‍♂️",
                 nameOfQuestion: "Какой вид спорта - твой?",
                 nameOfCountQuestions: "ВОПРОСОВ: ",
                 countOfQuestions: 12
            ),
            Menu(emoji: "🦁",
                 nameOfQuestion: "Какое ты животное?",
                 nameOfCountQuestions: "ВОПРОСОВ: ",
                 countOfQuestions: 5
            ),
            Menu(emoji: "🍕",
                 nameOfQuestion: "Какая твоя любимая пицца?",
                 nameOfCountQuestions: "ВОПРОСОВ: ",
                 countOfQuestions: 8
            )
        ]
    }
}
