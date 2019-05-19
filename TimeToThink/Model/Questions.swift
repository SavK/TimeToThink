//
//  Questions.swift
//  TimeToThink
//
//  Created by Savonevich Constantine on 5/12/19.
//  Copyright © 2019 Savonevich Konstantin. All rights reserved.
//

struct Questions {
    var text: String?
    var responseType: ResponseType
    var answers: [Answers]?
}


extension Questions {
    static func loadData() -> [Questions] {
        return [
            // MARK: - Questions for selectedTestType.car
            Questions(
                text: "Как давно у вас есть водительское удостоверение?",
                responseType: .single,
                answers: [
                    Answers(text: "Ещё не получал", answerType: .carHatchback),
                    Answers(text: "Меньше 2 лет", answerType: .carSedan),
                    Answers(text: "От 2 до 5 лет", answerType: .carPikup),
                    Answers(text: "Больше 5 лет", answerType: .carSuv)
                ]
            ),
            Questions(
                text: "Кем вы работаете?",
                responseType: .multiple,
                answers: [
                    Answers(text: "Программистом", answerType: .carSedan),
                    Answers(text: "Фермером", answerType: .carPikup),
                    Answers(text: "Курьером", answerType: .carHatchback),
                    Answers(text: "Банкиром", answerType: .carSuv),
                    Answers(text: "Клоуном", answerType: .carMinivan)
                ]
            ),
            Questions(
                text: "Насколько большая ваша семья?",
                responseType: .ranged,
                answers: [
                    Answers(text: "🙍‍♂️", answerType: .carHatchback),
                    Answers(text: "", answerType: .carSedan),
                    Answers(text: "", answerType: .carPikup),
                    Answers(text: "", answerType: .carSuv),
                    Answers(text: "👨‍👩‍👧‍👦", answerType: .carMinivan)
                ]
            ),
            
            // MARK: - Questions for selectedTestType.sport
            Questions(
                text: "Какую пищу предпочитаете?",
                responseType: .single,
                answers: [
                    Answers(text: "Стейк", answerType: .sportSwimming),
                    Answers(text: "Рыба", answerType: .sportFootball),
                    Answers(text: "Морковка", answerType: .sportHockey),
                    Answers(text: "Кукуруза", answerType: .sportChess),
                    Answers(text: "Кукуруза", answerType: .sportWrestling)
                ]
            ),
            Questions(
                text: "Какую пищу предпочитаете?",
                responseType: .multiple,
                answers: [
                    Answers(text: "Стейк", answerType: .sportSwimming),
                    Answers(text: "Рыба", answerType: .sportFootball),
                    Answers(text: "Морковка", answerType: .sportHockey),
                    Answers(text: "Кукуруза", answerType: .sportChess),
                    Answers(text: "Кукуруза", answerType: .sportWrestling)
                ]
            ),
            Questions(
                text: "Какую пищу предпочитаете?",
                responseType: .ranged,
                answers: [
                    Answers(text: "Стейк", answerType: .sportSwimming),
                    Answers(text: "Рыба", answerType: .sportFootball),
                    Answers(text: "Морковка", answerType: .sportHockey),
                    Answers(text: "Кукуруза", answerType: .sportChess),
                    Answers(text: "Кукуруза", answerType: .sportWrestling)
                ]
            ),
            
            // MARK: - Questions for selectedTestType.animal
            Questions(
                text: "Какую пищу предпочитаете?",
                responseType: .single,
                answers: [
                    Answers(text: "Стейк", answerType: .animalDog),
                    Answers(text: "Рыба", answerType: .animalCat),
                    Answers(text: "Морковка", answerType: .animalRabbit),
                    Answers(text: "Кукуруза", answerType: .animalTurtle)
                ]
            ),
            Questions(
                text: "Что вам нравится делать?",
                responseType: .multiple,
                answers: [
                    Answers(text: "Плавать", answerType: .animalTurtle),
                    Answers(text: "Спать", answerType: .animalCat),
                    Answers(text: "Обниматься", answerType: .animalRabbit),
                    Answers(text: "Есть", answerType: .animalDog),
                    Answers(text: "Гулять", answerType: .animalDog)
                ]
            ),
            Questions(
                text: "Какую пищу предпочитаете?",
                responseType: .ranged,
                answers: [
                    Answers(text: "Ненавижу", answerType: .animalCat),
                    Answers(text: "Нервничаю", answerType: .animalRabbit),
                    Answers(text: "Не замечаю", answerType: .animalTurtle),
                    Answers(text: "Обожаю", answerType: .animalDog)
                ]
            ),
            
            // MARK: - Questions for selectedTestType.pizza
            Questions(
                text: "Какую пищу предпочитаете?",
                responseType: .single,
                answers: [
                    Answers(text: "Стейк", answerType: .pizzaMargarita),
                    Answers(text: "Рыба", answerType: .pizzaPepperoni),
                    Answers(text: "Морковка", answerType: .pizzaHawaiian),
                    Answers(text: "Кукуруза", answerType: .pizzaMushrooms)
                ]
            ),
            Questions(
                text: "Какую пищу предпочитаете?",
                responseType: .multiple,
                answers: [
                    Answers(text: "Стейк", answerType: .pizzaMargarita),
                    Answers(text: "Рыба", answerType: .pizzaPepperoni),
                    Answers(text: "Морковка", answerType: .pizzaHawaiian),
                    Answers(text: "Кукуруза", answerType: .pizzaMushrooms)
                ]
            ),
            Questions(
                text: "Какую пищу предпочитаете?",
                responseType: .ranged,
                answers: [
                    Answers(text: "Стейк", answerType: .pizzaMargarita),
                    Answers(text: "Рыба", answerType: .pizzaPepperoni),
                    Answers(text: "Морковка", answerType: .pizzaHawaiian),
                    Answers(text: "Кукуруза", answerType: .pizzaMushrooms)
                ]
            )
        ]
    }
}
