//
//  ShakeAnimation.swift
//  CocktailUp
//
//  Created by Thibault Ballof on 09/06/2023.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    let name: String
    let animationView = LottieAnimationView()

    func makeUIView(context: Context) -> some UIView {
        let view = UIView(frame: .zero)

        animationView.animation = LottieAnimation.named(name)
        animationView.contentMode = .scaleAspectFit
        animationView.play()
        animationView.loopMode = .loop

        view.addSubview(animationView)

        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        animationView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true

        return view
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {

    }
}
