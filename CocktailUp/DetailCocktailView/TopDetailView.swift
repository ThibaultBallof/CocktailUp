//
//  TopDetailView.swift
//  CocktailUp
//
//  Created by Thibault Ballof on 09/06/2023.
//

import SwiftUI

struct TopDetailView: View {
    let imageUrlDrink: String

    var body: some View {
        AsyncImage(url: URL(string: imageUrlDrink)) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image.resizable()
                    .ignoresSafeArea()
            case .failure:
                Image(systemName: "photo")
            @unknown default:
                EmptyView()
            }
        }
        .frame(width: 450, height: 300)
        .fixedSize()
        .aspectRatio(contentMode: .fill)
    }
}

struct TopDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TopDetailView(imageUrlDrink: "https://www.thecocktaildb.com/images/media/drink/vr6kle1504886114.jpg")
    }
}
