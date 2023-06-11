//
//  DetailCocktailListView.swift
//  CocktailUp
//
//  Created by Thibault Ballof on 09/06/2023.
//

import SwiftUI

struct DetailCocktailListView: View {
    var inscruction: String?

    var body: some View {
        if let inscruction = inscruction {
            Text(inscruction)
                .fontWeight(.bold)
                .padding()
        }
    }
}

struct DetailCocktailListView_Previews: PreviewProvider {
    static var previews: some View {
        DetailCocktailListView(inscruction: "Rub the rim of the glass with the lime slice to make the salt stick to it. Take care to moisten only the outer rim and sprinkle the salt on it. The salt should present to the lips of the imbiber and never mix into the cocktail. Shake the other ingredients with ice, then carefully pour into the glass.")
    }
}
