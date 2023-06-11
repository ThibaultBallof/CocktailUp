//
//  ErrorView.swift
//  CocktailUp
//
//  Created by Thibault Ballof on 10/06/2023.
//

import SwiftUI

struct ErrorView: View {
    @EnvironmentObject var viewModel: ViewModel
    let errorTupple: (String, String)

    var body: some View {
        VStack {
            LottieView(name: errorTupple.1)
                .frame(width: 300, height: 300)
            Text(errorTupple.0)
                .multilineTextAlignment(.center)
                .bold()
                .padding()
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(errorTupple: ("test", "not-found")).environmentObject(ViewModel())
    }
}
