//
//  GetExampleItemsUseCaseTests.swift
//  CleanExampleTests
//
//  Created by Eduardo Sanches Bocato on 17/02/20.
//  Copyright © 2020 Bocato. All rights reserved.
//

import XCTest
@testable import CleanExample

final class GetExampleItemsUseCaseTests: XCTestCase {
    
    func test_whenExecuteSucceeds_itemsShouldBeTransformed() {
        // Given
        let itemsServiceProviderStub = ItemsServiceProviderStub()
        let stubbedItems: [ItemEntity] = [
            .init(id: 1, name: "name", description: "description")
        ]
        itemsServiceProviderStub.getItemsResultToBeReturned = .success(stubbedItems)
        let sut = GetExampleItemsUseCase(
            itemsService: itemsServiceProviderStub
        )
        let expectedItems: [ExampleItem] = [.init(title: "name", description: "description")]
        // When
        let executeExpectation = expectation(description: "executeExpectation")
        var itemsReturned: [ExampleItem]?
        sut.execute { result in
            guard case let .success(data) = result else {
                XCTFail("Execute failed.")
                return
            }
            itemsReturned = data
            executeExpectation.fulfill()
        }
        wait(for: [executeExpectation], timeout: 1.0)
        // Then
        XCTAssertEqual(expectedItems.first?.description, itemsReturned?.first?.description)
        XCTAssertEqual(expectedItems.first?.title, itemsReturned?.first?.title)
    }
    
    func test_whenExecuteFails_errorShouldBeMapped() {
        // Given
        let itemsServiceProviderStub = ItemsServiceProviderStub()
        let errorDummy = NSError()
        itemsServiceProviderStub.getItemsResultToBeReturned = .failure(.serialization(errorDummy))
        let sut = GetExampleItemsUseCase(
            itemsService: itemsServiceProviderStub
        )
        let expectedError: GetExampleItemsUseCaseError = .service(.serialization(errorDummy))
        // When
        let executeExpectation = expectation(description: "executeExpectation")
        var errorReturned: GetExampleItemsUseCaseError?
        sut.execute { result in
            guard case let .failure(error) = result else {
                XCTFail("Execute succeeded.")
                return
            }
            errorReturned = error
            executeExpectation.fulfill()
        }
        wait(for: [executeExpectation], timeout: 1.0)
        // Then
        XCTAssertEqual(expectedError.localizedDescription, errorReturned?.localizedDescription)
    }
    
}

// MARK: - Testing Helpers
final class ItemsServiceProviderStub: ItemsServiceProvider {
    
    var getItemsResultToBeReturned: Result<[ItemEntity], ItemsServiceError> = .success([])
    func getItems(then: @escaping (Result<[ItemEntity], ItemsServiceError>) -> Void) {
        then(getItemsResultToBeReturned)
    }
    
}
