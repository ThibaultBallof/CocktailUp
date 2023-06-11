//
//  MockService.swift
//  CocktailUp
//
//  Created by Thibault Ballof on 11/06/2023.
//

import Foundation
import Combine

final class MockSevice: NetworkServicing {
    var dataMock: DataMock = .goodData

    func selectedDataMock() -> Data? {
        var data: Data?
        switch dataMock {
        case .emptyData:
            var dataMocked: Data? {
                let bundle = Bundle(for: MockSevice.self)
                let url = bundle.url(forResource: "EmptyMock", withExtension: ".json")!
                return try? Data(contentsOf: url)
            }
            data = dataMocked
        case .badData:
            var dataMocked: Data? {
                let bundle = Bundle(for: MockSevice.self)
                let url = bundle.url(forResource: "BadMock", withExtension: ".json")!
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

final class MockServiceWithNetworkError: NetworkServicing {
    func fetchCocktail<T: Decodable>(type: T.Type, text: String?, url: String) -> AnyPublisher<T, Error> {
        let error = NSError(domain: "google.fr", code: 500, userInfo: [NSLocalizedDescriptionKey: "Network error"])

        return Fail<T, Error>(error: error)
            .eraseToAnyPublisher()
    }
}
