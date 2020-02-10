//
//  GetExampleItemsUseCase.swift
//  CleanExample
//
//  Created by Eduardo Bocato on 10/02/20.
//  Copyright © 2020 Bocato. All rights reserved.
//

import Foundation

enum GetExampleItemsUseCaseError: Error {
    case service(_ error: ItemsServiceError)
}

protocol GetExampleItemsUseCaseProvider {
    func execute(then: @escaping (Result<[ExampleItem], GetExampleItemsUseCaseError>) -> Void)
}

final class GetExampleItemsUseCase: GetExampleItemsUseCaseProvider {
    
    // MARK: - Dependencies
    
    private let itemsService: ItemsServiceProvider
    
    // MARK: - Initialization
    
    init(itemsService: ItemsServiceProvider = ItemsService()) {
        self.itemsService = itemsService
    }
    
    // MARK: - Logic
    
    func execute(then: @escaping (Result<[ExampleItem], GetExampleItemsUseCaseError>) -> Void) {
        itemsService.getItems { [unowned self] result in
            switch result {
            case let .success(entities):
                self.handleSuccess(input: entities, then: then)
            case let .failure(error):
                self.handleServiceFailure(input: error, then: then)
            }
        }
    }
    
    private func handleSuccess(
        input: [ItemEntity],
        then: (Result<[ExampleItem], GetExampleItemsUseCaseError>) -> Void
    ) {
        let domainModels = input.map { ExampleItem(title: $0.name, description: $0.description) }
        then(.success(domainModels))
    }
    
    private func handleServiceFailure(
        input: ItemsServiceError,
        then: (Result<[ExampleItem], GetExampleItemsUseCaseError>) -> Void
    ) {
        let useCaseError = GetExampleItemsUseCaseError.service(input)
        then(.failure(useCaseError))
    }
    
}
