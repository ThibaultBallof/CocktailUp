//
//  CocktailUpTests.swift
//  CocktailUpTests
//
//  Created by Thibault Ballof on 06/06/2023.
//

import XCTest
@testable import CocktailUp

@MainActor
final class ViewModelTests: XCTestCase {

    func testFetchCocktails() {
        let expectation = XCTestExpectation(description: "Fetch cocktails")
        let searchText = "test"
        let url = "https://google.com"

        let service = MockSevice()
        service.dataMock = .goodData
        let viewModel = ViewModel(service: service)

        viewModel.fetchCocktails(searchText: searchText, url: url)

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertEqual(viewModel.drinks.drinks.first?.idDrink, "11007")
            XCTAssertNil(viewModel.error)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 2.0)
    }

    func testFetchCocktailsWithEmptyData() {
        let expectation = XCTestExpectation(description: "Fetch cocktails")
        let searchText = "test"
        let url = "https://google.com"

        let service = MockSevice()
        service.dataMock = .emptyData
        let viewModel = ViewModel(service: service)

        viewModel.fetchCocktails(searchText: searchText, url: url)

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertEqual(viewModel.drinks.drinks.first?.idDrink, nil)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 2.0)
    }

    func testFetchCocktailsWithBadData() {
        let expectation = XCTestExpectation(description: "Fetch cocktails")
        let searchText = "test"
        let url = "https://google.com"

        let service = MockSevice()
        service.dataMock = .badData
        let viewModel = ViewModel(service: service)

        viewModel.fetchCocktails(searchText: searchText, url: url)

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertNotEqual(viewModel.drinks.drinks.first?.idDrink, "11007")
            XCTAssertNotNil(viewModel.error)

            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 2.0)
    }

    func testFetchCocktailsWithNetworkError() {
        let expectation = XCTestExpectation(description: "Fetch cocktails with network error")
        let searchText = "test"
        let url = "https://google.com"

        let service = MockServiceWithNetworkError()
        let viewModel = ViewModel(service: service)

        viewModel.fetchCocktails(searchText: searchText, url: url)

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertNotNil(viewModel.error)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 2.0)
    }

    func testFetchRandomCocktails() {
        let expectation = XCTestExpectation(description: "Fetch cocktails")

        let service = MockSevice()
        service.dataMock = .goodData
        let viewModel = ViewModel(service: service)

        viewModel.fetchRandomCocktail()

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertEqual(viewModel.drinks.drinks.first?.idDrink, "11007")
            XCTAssertNil(viewModel.error)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 2.0)
    }

    func testFetchRandomCocktailsWithBadData() {
        let expectation = XCTestExpectation(description: "Fetch cocktails")
        let searchText = "test"
        let url = "https://google.com"

        let service = MockSevice()
        service.dataMock = .badData
        let viewModel = ViewModel(service: service)

        viewModel.fetchCocktails(searchText: searchText, url: url)

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertNotEqual(viewModel.drinks.drinks.first?.idDrink, "11007")
            XCTAssertNotNil(viewModel.error)

            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 2.0)
    }

    func testFetchRandomCocktailsWithEmptyData() {
        let expectation = XCTestExpectation(description: "Fetch cocktails")

        let service = MockSevice()
        service.dataMock = .emptyData
        let viewModel = ViewModel(service: service)

        viewModel.fetchRandomCocktail()

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertEqual(viewModel.drinks.drinks.first?.idDrink, nil)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 2.0)
    }

    func testFetchRandomCocktailsWithNetworkError() {
        let expectation = XCTestExpectation(description: "Fetch cocktails with network error")

        let service = MockServiceWithNetworkError()
        let viewModel = ViewModel(service: service)

        viewModel.fetchRandomCocktail()

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertNotNil(viewModel.error)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 2.0)
    }
}
