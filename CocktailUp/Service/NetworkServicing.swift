//
//  NetworkServicing.swift
//  CocktailUp
//
//  Created by Thibault Ballof on 06/06/2023.
//

import Foundation
import Combine

protocol NetworkServicing: ObservableObject {
    func fetchCocktail<T: Decodable>(type: T.Type, text: String?, url: String) -> AnyPublisher<T, Error>
}

final class Service: NetworkServicing {

    func fetchCocktail<T: Decodable>(type: T.Type, text: String?, url: String) -> AnyPublisher<T, Error> {

        var urlString = url

        if let text = text, !text.isEmpty {
            urlString += text
        }
        guard let api = URL(string: urlString) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }

        var request = URLRequest(url: api)
        request.httpMethod = "GET"

        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse,
                      (200..<400).contains(httpResponse.statusCode) else {
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
