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
                text: "Какая профессия вам ближе?",
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
            Questions(
                text: "Какая у вас зароботная плата?",
                responseType: .single,
                answers: [
                    Answers(text: "до 499$", answerType: .carHatchback),
                    Answers(text: "500 - 999$", answerType: .carSedan),
                    Answers(text: "1000 - 2000$", answerType: .carPikup),
                    Answers(text: "Больше 2000$", answerType: .carSuv)
                ]
            ),
            
            // MARK: - Questions for selectedTestType.sport
            Questions(
                text: "Cколько времени вы сможете уделять спорту?",
                responseType: .single,
                answers: [
                    Answers(text: "Минамально", answerType: .sportSwimming),
                    Answers(text: "Пару часов в неделю", answerType: .sportChess),
                    Answers(text: "Пару дней в неделю", answerType: .sportWrestling),
                    Answers(text: "Всё свбодное время", answerType: .sportFootball)
                ]
            ),
            Questions(
                text: "Вы любите бегать?",
                responseType: .ranged,
                answers: [
                    Answers(text: "💔", answerType: .sportChess),
                    Answers(text: "Не в восторге", answerType: .sportWrestling),
                    Answers(text: "Нейтрально", answerType: .sportSwimming),
                    Answers(text: "Более чем", answerType: .sportHockey),
                    Answers(text: "❤️", answerType: .sportFootball)
                ]
            ),
            Questions(
                text: "Как вы обычно проводите своё свободное время?",
                responseType: .multiple,
                answers: [
                    Answers(text: "Читаю книгу", answerType: .sportChess),
                    Answers(text: "Играю в компьютер", answerType: .sportHockey),
                    Answers(text: "Общаюсь с друзьями", answerType: .sportWrestling),
                    Answers(text: "Сижу в интернете", answerType: .sportSwimming),
                    Answers(text: "Гуляю", answerType: .sportFootball)
                ]
            ),
            Questions(
                text: "Вы любите работать в команде?",
                responseType: .ranged,
                answers: [
                    Answers(text: "🤬", answerType: .sportChess),
                    Answers(text: "Не в восторге", answerType: .sportWrestling),
                    Answers(text: "Нейтрально", answerType: .sportSwimming),
                    Answers(text: "Более чем", answerType: .sportHockey),
                    Answers(text: "😍", answerType: .sportFootball)
                ]
            ),
            Questions(
                text: "Какая у вас физическая подготовка?",
                responseType: .single,
                answers: [
                    Answers(text: "Раньше спортом не занимался", answerType: .sportChess),
                    Answers(text: "Подготовки нет, но есть желание", answerType: .sportSwimming),
                    Answers(text: "Бегаю по вечерам", answerType: .sportHockey),
                    Answers(text: "Хожу на турники, брусья во дворе", answerType: .sportWrestling),
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
                    Answers(text: "Есть", answerType: .animalDog),
                    Answers(text: "Обниматься", answerType: .animalRabbit),
                    Answers(text: "Гулять", answerType: .animalDog)
                ]
            ),
            Questions(
                text: "какой подарок вы бы хотели получить?",
                responseType: .multiple,
                answers: [
                    Answers(text: "Не люблю подарки", answerType: .animalCat),
                    Answers(text: "Любой", answerType: .animalCat),
                    Answers(text: "Красивый", answerType: .animalRabbit),
                    Answers(text: "Запоминающийся", answerType: .animalTurtle),
                    Answers(text: "не важно, главное внимание", answerType: .animalDog)
                ]
            ),
            Questions(
                text: "Вы любите ездить на машине?",
                responseType: .ranged,
                answers: [
                    Answers(text: "💔", answerType: .animalCat),
                    Answers(text: "Нервничаю", answerType: .animalRabbit),
                    Answers(text: "Не замечаю", answerType: .animalTurtle),
                    Answers(text: "❤️", answerType: .animalDog)
                ]
            ),
            
            // MARK: - Questions for selectedTestType.pizza
            Questions(
                text: "Какая ситуация наиболее точно описывает ваш повод для заказа пиццы?",
                responseType: .single,
                answers: [
                    Answers(text: "Купил пиво, нужна закуска", answerType: .pizzaPepperoni),
                    Answers(text: "Еда для большой компании", answerType: .pizzaMushrooms),
                    Answers(text: "Хочется чего-нибудь вкусного", answerType: .pizzaHawaiian),
                    Answers(text: "Обед в офис", answerType: .pizzaMushrooms)
                ]
            ),
            Questions(
                text: "Я люблю когда пицца ... ?",
                responseType: .multiple,
                answers: [
                    Answers(text: "С мясом", answerType: .pizzaPepperoni),
                    Answers(text: "Необычная", answerType: .pizzaHawaiian),
                    Answers(text: "Вегетарианская", answerType: .pizzaMushrooms),
                    Answers(text: "Недорогая", answerType: .pizzaMargarita),
                    Answers(text: "Вкусная", answerType: .pizzaMargarita)
                ]
            ),
            Questions(
                text: "Как сильно вы любите сыр в пицце?",
                responseType: .ranged,
                answers: [
                    Answers(text: "🤮", answerType: .pizzaMushrooms),
                    Answers(text: "Не замечаю", answerType: .pizzaPepperoni),
                    Answers(text: "Люблю", answerType: .pizzaHawaiian),
                    Answers(text: "😍", answerType: .pizzaMargarita)
                ]
            )
        ]
    }
}
