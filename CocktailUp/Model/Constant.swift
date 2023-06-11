//
//  Constant.swift
//  CocktailUp
//
//  Created by Thibault Ballof on 07/06/2023.
//

import Foundation

let getCocktailByNameURL = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s="
let getRandomCocktailURL = "https://www.thecocktaildb.com/api/json/v1/1/random.php"
let pathAlcoholURL = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?i="
let pathNonAlcoholURL = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Non_Alcoholic"
let pathAlcoholImageURL = "https://www.thecocktaildb.com/images/ingredients/"
let pathCocktailByID = "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i="

enum ButtonSelected {
    case instruction, ingredient
}

enum DataMock {
    case goodData, badData
}

enum Alcohol {
    case gin
    case rum
    case whisky
    case vodka
    case tequila

    var url: URL? {
        switch self {
        case .gin:
            return URL(string: "https://www.thecocktaildb.com/images/ingredients/gin-Small.png")
        case .rum:
            return URL(string: "https://www.thecocktaildb.com/images/ingredients/rum-Small.png")
        case .whisky:
            return URL(string: "https://www.thecocktaildb.com/images/ingredients/whisky-Small.png")
        case .vodka:
            return URL(string: "https://www.thecocktaildb.com/images/ingredients/vodka-Small.png")
        case .tequila:
            return URL(string: "https://www.thecocktaildb.com/images/ingredients/tequila-Small.png")
        }

    }
}
