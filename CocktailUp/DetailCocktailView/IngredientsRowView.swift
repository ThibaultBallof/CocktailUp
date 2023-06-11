//
//  IngredientsRowView.swift
//  CocktailUp
//
//  Created by Thibault Ballof on 09/06/2023.
//

import SwiftUI

struct IngredientsRowView: View {
    let ingregient: String
    let measure: String

    var body: some View {
        HStack {
            Text(ingregient)
            Spacer()
            Text(measure)
        }
        .padding()
        .addShadow()
    }
}

struct IngredientsRowView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientsRowView(ingregient: "Test", measure: "Test")
    }
}
