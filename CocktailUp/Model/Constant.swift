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

enum ButtonSelected {
    case instruction, ingredient
}

enum DataMock {
    case goodData, badData, emptyData
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

let drinkExample = Drink(idDrink: "1", strDrink: "Mojito", strTags: "", strCategory: "Alcohol", strInstructions: "Rub the rim of the glass with the lime slice to make the salt stick to it. Take care to moisten only the outer rim and sprinkle the salt on it. The salt should present to the lips of the imbiber and never mix into the cocktail. Shake the other ingredients with ice, then carefully pour into the glass.", strDrinkThumb: "https://www.thecocktaildb.com/images/media/drink/5noda61589575158.jpg", strIngredient1: "", strIngredient2: "", strIngredient3: "", strIngredient4: "", strIngredient5: "", strIngredient6: "", strIngredient7: "", strIngredient8: "", strIngredient9: "", strIngredient10: "", strIngredient11: "", strIngredient12: "", strIngredient13: "", strIngredient14: "", strIngredient15: "", strMeasure1: "", strMeasure2: "", strMeasure3: "", strMeasure4: "", strMeasure5: "", strMeasure6: "", strMeasure7: "", strMeasure8: "", strMeasure9: "", strMeasure10: "", strMeasure11: "", strMeasure12: "", strMeasure13: "", strMeasure14: "", strMeasure15: "")
