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

class Service: NetworkServicing {

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

class MockSevice: NetworkServicing {
    var dataMock: DataMock = .goodData

    func selectedDataMock() -> Data? {

        var data: Data?
        switch dataMock {
        case .badData:
            var dataMocked: Data? {
                let bundle = Bundle(for: MockSevice.self)
                let url = bundle.url(forResource: "EmptyMock", withExtension: ".json")!
                return try? Data(contentsOf: url)
            }
            data = dataMocked
        case .goodData:
            var dataMocked: Data? {
                let bundle = Bundle(for: MockSevice.self)
                let url = bundle.url(forResource: "GoodMock", withExtension: ".json")!
                return try? Data(contentsOf: url)
            }
            data = dataMocked

        }

        return data
    }

    func fetchCocktail<T: Decodable>(type: T.Type, text: String?, url: String) -> AnyPublisher<T, Error> {
        let selectedData = selectedDataMock()

        return Deferred {
            Future<T, Error> { promise in
                let fetchTask = Task {
                    guard let selectedData = selectedData else { return }

                    do {
                        let result = try JSONDecoder().decode(type.self, from: selectedData)
                        promise(.success(result))
                    } catch let error {
                        print(error)
                        promise(.failure(error))
                    }
                }
                Task {
                    await fetchTask.value
                }
            }
        }.eraseToAnyPublisher()
    }
}

class MockServiceWithNetworkError: NetworkServicing {
    func fetchCocktail<T: Decodable>(type: T.Type, text: String?, url: String) -> AnyPublisher<T, Error> {
        let error = NSError(domain: "google.fr", code: 500, userInfo: [NSLocalizedDescriptionKey: "Network error"])

        return Fail<T, Error>(error: error)
            .eraseToAnyPublisher()
    }
}
