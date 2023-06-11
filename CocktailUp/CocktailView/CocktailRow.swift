//
//  CocktailRow.swift
//  CocktailUp
//
//  Created by Thibault Ballof on 06/06/2023.
//

import SwiftUI

struct CocktailRow: View {
    let title: String
    let subtitle: String
    let imageUrl: String
    var body: some View {
        HStack(alignment: .center) {
            AsyncImage(url: URL(string: imageUrl)) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .frame(width: 70, height: 70)
                        .cornerRadius(15)
                } else if phase.error != nil {
                    Image(systemName: "square.and.arrow.up.circle.fill")
                } else {
                    ProgressView()
                        .font(.largeTitle)
                }
            }
            .padding()
            VStack(alignment: .leading, spacing: 5) {
                Text(title)
                    .fontWeight(.bold)
                    .font(.system(size: 20))
                Text(subtitle)
                    .fontWeight(.light)
            }
            Spacer()
        }.addShadow()

    }
}

struct CocktailRow_Previews: PreviewProvider {
    static var previews: some View {
        CocktailRow(title: "Virgin Mojito", subtitle: "Vodka", imageUrl: "https://www.thecocktaildb.com/images/media/drink/vr6kle1504886114.jpg/preview")
    }
}
