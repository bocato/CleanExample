//
//  ExampleInteractorTests.swift
//  CleanExampleTests
//
//  Created by Eduardo Sanches Bocato on 17/02/20.
//  Copyright © 2020 Bocato. All rights reserved.
//

import XCTest
@testable import CleanExample

final class ExampleInteractorTests: XCTestCase {
    
    func test_() {
        // Given
        let presentationLogicSpy = ExamplePresentationLogicSpy()
        let sut = ExampleInteractor(
            presenter: ExamplePresentationLogic,
            getExampleItemsUseCase: <#T##GetExampleItemsUseCaseProvider#>)
        // When
        // Then
    }
    
}

// MARK: - Testing Helpers

final class ExamplePresentationLogicSpy:
ExamplePresentationLogic {
    
    private(set) var presentExampleItemsListCalled = false
    private(set) var presentExampleItemsListResponsePassed: Example.List.Response?
    func presentExampleItemsList(_ response: Example.List.Response) {
        presentExampleItemsListCalled = true
        presentExampleItemsListResponsePassed = response
    }
    
    private(set) var presentExampleItemsListErrorCalled = false
    private(set) var presentExampleItemsListErrorResponsePassed: GetExampleItemsUseCaseError?
    func presentExampleItemsListError(_ response: GetExampleItemsUseCaseError) {
        presentExampleItemsListErrorCalled = true
        presentExampleItemsListErrorResponsePassed = response
    }
    
    private(set) var presentExampleItemsSelectionCalled = false
    private(set) var presentExampleItemsSelectionResponsePassed: Example.Selection.Response?
    func presentExampleItemsSelection(_ response: Example.Selection.Response) {
        presentExampleItemsSelectionCalled = true
        presentExampleItemsSelectionResponsePassed = response
    }
    
}
