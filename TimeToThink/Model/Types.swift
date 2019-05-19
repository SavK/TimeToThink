//
//  Types.swift
//  TimeToThink
//
//  Created by Savonevich Constantine on 5/18/19.
//  Copyright © 2019 Savonevich Konstantin. All rights reserved.
//


// MARK: - Enum of all available tests
enum SelectedTestType {
    case car
    case sport
    case animal
    case pizza
    
    var countOfQuestions: Int {
        switch self {
        case .car:
            return 3
        case .sport:
            return 3
        case .animal:
            return 3
        case .pizza:
            return 3
        }
    }
}
// MARK: - Enum of all available ressponse types
enum ResponseType {
    case single
    case multiple
    case ranged
}
// MARK: - Enum of answers types
enum AnswerType {
    
    /// car answers
    case carSedan
    case carHatchback
    case carSuv
    case carMinivan
    case carPikup
    
    /// sport answers
    case sportSwimming
    case sportFootball
    case sportHockey
    case sportChess
    case sportWrestling
    
    /// animal answers
    case animalDog
    case animalCat
    case animalRabbit
    case animalTurtle
    
    /// pizza answers
    case pizzaMargarita
    case pizzaPepperoni
    case pizzaHawaiian
    case pizzaMushrooms
    
    var definition: String {
        switch self {
            
        // car answers definition
        case .carSedan:
            return "Вероятнее всего вам подойдёт автомобиль в кузове - седан.   Он является самым популярным универсальным.   Можно как детей в садик завести, так и с комфортом попутешествовать."
        case .carHatchback:
            return "Вам однозначно нужен автомобиль в кузове - хетчбек.   Маленький и юркий, недорогой в обслуживании, - практически идеальный для города."
        case .carSuv:
            return "Вам подходит самый практичный класс - SUV.  Не спеша и с комфортом довезёт в любую точку земного шара.  К тому же, он является самым уважаемым и желанным среди автомобилистов."
        case .carMinivan:
            return "Можете подыскивать себе автомобиль в кузове - минивен.   Он достаточно большой, что бы влезла вся семья, да ещё и для домашних питомцев место найдётся.   Отличный вариант для путешествий."
        case .carPikup:
            return "Автомобиль в кузове пикап - идеальный для практичного человека, и это то, что вам нужно.  Без проблем можно возить что угодно и куда угодно, благодоря его проходимости."
            
        // sport answers definition
        case .sportSwimming:
            return "text sportSwimming"
        case .sportFootball:
            return "text sportFootball"
        case .sportHockey:
            return "text sportHockey"
        case .sportChess:
            return "text sportChess"
        case .sportWrestling:
            return "text sportWrestling"
            
        /// animal answers definition
        case .animalDog:
            return "Из всех животных, вы больше всего схожи с 🐶.   Вы любите быть в комапнии друзей и всегда готовы прийти на помощь, если она кому-нибудь понадобится."
        case .animalCat:
            return "Вы отлично подходите в семейство 🐱!   Вы цените одиночество, любите гулять сами по себе.  Вы давольно загадочны."
        case .animalRabbit:
            return "Вы - 🐰. Вам нравится всё мягкое.  Вы здоровы и полны энергии."
        case .animalTurtle:
            return "Согласно расчётам, вы - 🐢.  Ваша сила — в мудрости.  Медленный и вдумчивый выигрывает на больших дистанциях."
            
        /// pizza answers definition
        case .pizzaMargarita:
            return "text pizzaMargarita"
        case .pizzaPepperoni:
            return "text pizzaPepperoni"
        case .pizzaHawaiian:
            return "text pizzaHawaiian"
        case .pizzaMushrooms:
            return "text pizzaMushrooms"
        }
    }
}

