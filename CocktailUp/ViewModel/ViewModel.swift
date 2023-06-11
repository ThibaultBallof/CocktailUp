//
//  ViewModel.swift
//  CocktailUp
//
//  Created by Thibault Ballof on 06/06/2023.
//

import Foundation
import Combine

@MainActor
final class ViewModel: ObservableObject {
    @Published var drinks: Drinks = Drinks(drinks: [])
    @Published var searchText = ""
    @Published var selectedButton: ButtonSelected = .instruction
    @Published var randomDrink: Drink?
    @Published var error: Error?
    private var cancellables = Set<AnyCancellable>()
    private var searchSubscription: AnyCancellable?
    private var service: any NetworkServicing

    init(service: any NetworkServicing = Service()) {
        self.service = service
        getUpdateOfSearchField()
    }

    func getUpdateOfSearchField() {
        searchSubscription = self.$searchText
            .debounce(for: 0.3, scheduler: DispatchQueue.main)
            .sink(receiveValue: { [weak self] newValue in

                guard let strongSelf = self else { return }
                strongSelf.fetchCocktails(searchText: newValue, url: getCocktailByNameURL)
            })
    }

    func fetchCocktails(searchText: String?, url: String) {
        service.fetchCocktail(type: Drinks.self, text: searchText, url: url)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in

                guard let strongSelf = self else { return }
                switch completion {
                case .finished:
                    strongSelf.error = nil
                case .failure(let error):
                    strongSelf.error = error
                }
            } receiveValue: { [weak self] drinks in

                guard let strongSelf = self else { return }
                strongSelf.drinks = drinks
            }
            .store(in: &cancellables)
    }

    func fetchRandomCocktail() {
        service.fetchCocktail(type: Drinks.self, text: nil, url: getRandomCocktailURL)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in

                guard let strongSelf = self else { return }
                switch completion {
                case .finished:
                    strongSelf.error = nil
                case .failure(let error):
                    strongSelf.error = error
                }
            } receiveValue: { [weak self] drinks in

                guard let strongSelf = self else { return }
                strongSelf.randomDrink = drinks.drinks.first
            }
            .store(in: &cancellables)
    }

    func handleURLSessionError(_ error: Error) -> (String, String) {
        if error is URLError {
            return (String(localized: "url_error"), "error-cocktail")
        } else if error is DecodingError {
            return (String(localized: "decoding_error"), "not-found")
        } else {
            return (String(localized: "unknow_error"), "not-found")
        }
    }

}
