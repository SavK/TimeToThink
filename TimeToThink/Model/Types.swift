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
            return 4
        case .sport:
            return 5
        case .animal:
            return 4
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
            return "Автомобиль в кузове пикап - идеальный для практичного человека, и это то, что вам нужно.  Благодоря его проходимости вы без проблем сможете возить что угодно и куда угодно."
            
        // sport answers definition
        case .sportSwimming:
            return "Вам отлично подойдёт плавание.  Плавание – это тот уникальный случай, когда с помощью физической нагрузки можно одновременно получить удовольствие и оздоровить организм."
        case .sportFootball:
            return "Обратите внимание на футбол - в настоящее время самый популярный и массовый вид спорта в мире.   Это не только прекрастное зрелище, но и навыки работы в команде, воспитание характера."
        case .sportHockey:
            return "На труса вы не похожи, поэтому хоккей - это то, что вам нужно!   Этот зрелищный и динамичный вид спорта не должен оставить вас равнодушным."
        case .sportChess:
            return "Попробуйте себя в шахматах.   Они развивают очень большой спектр навыков (память, внимание, смекалку и логику) а так же воспитывают волю, находчивость и характер."
        case .sportWrestling:
            return "У вас все шансы приуспеть в одном из старейших олимпийских видов спорта - борьбе.   Существует масса различных стилей, по этому стоит подобрать тот, который понравится больше остальных."
            
        /// animal answers definition
        case .animalDog:
            return "Из всех животных, вы больше всего схожи с 🐶.   Вы любите быть в комапнии друзей и всегда готовы прийти на помощь, если она кому-нибудь понадобится."
        case .animalCat:
            return "Вы отлично подходите в семейство 🐱!   Вы цените одиночество, любите гулять сами по себе.  Вы давольно загадочны."
        case .animalRabbit:
            return "Вы - 🐰. Представитель самих милых и пушистых животных.   Вам нравится всё мягкое.  Вы здоровы и полны энергии."
        case .animalTurtle:
            return "Согласно расчётам, вы - 🐢.  Ваша сила — в мудрости.  Медленный и вдумчивый выигрывает на больших дистанциях."
            
        /// pizza answers definition
        case .pizzaMargarita:
            return "Ваша любимая пицца - Маргарита, традиционная итальянская пицца, пожалуй, самая популярная в мире, даже меню любой пиццерии начинается, как правило, именно с неё."
        case .pizzaPepperoni:
            return "Ваша любимая пицца - Пепперони, очень популярный вид пиццы как в Европе, так и в Америке.   Её название соответствует основному ингредиенту солями пепперони, который имеет остороватый вкус."
        case .pizzaHawaiian:
            return "Ваша любимая пицца - Гавайская, с ананасами и курицей.   Она очень популярна в Европе, и несмотря на красивое наименование, к Гавайям не имеет никакого отношения."
        case .pizzaMushrooms:
            return "Ваша любимая пицца - Грибная. Вариант с шампиньонами не содержит мяса и за счет большого содержания в грибах белка, может вполне заменить мясную пиццу."
        }
    }
}

