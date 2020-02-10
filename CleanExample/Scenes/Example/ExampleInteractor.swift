//
//  ExampleInteractor.swift
//  CleanExample
//
//  Created by Eduardo Bocato on 06/02/20.
//  Copyright © 2020 Bocato. All rights reserved.
//

import Foundation

protocol ExampleBusinessLogic {
    func loadExampleItemsList(request: Example.List.Request)
    func selectExampleItem(request: Example.Selection.Request)
}

final class ExampleInteractor: ExampleBusinessLogic {
    
    // MARK: - Dependencies
    
    private let presenter: ExamplePresentationLogic
    private let getExampleItemsUseCase: GetExampleItemsUseCaseProvider
    
    // MARK: - Private Properties
    
    private var exampleItems = [ExampleItem]()
    
    // MARK: - Initialization
    
    init(
        presenter: ExamplePresentationLogic,
        getExampleItemsUseCase: GetExampleItemsUseCaseProvider
    ) {
        self.presenter = presenter
        self.getExampleItemsUseCase = getExampleItemsUseCase
    }
    
    // MARK: - ExampleBusinessLogic
    
    func loadExampleItemsList(request: Example.List.Request) {
        getExampleItemsUseCase.execute { [weak self, presenter] result in
            switch result {
            case let .success(items):
                self?.exampleItems = items
                presenter.presentExampleItemsList(.init(items: items))
            case let .failure(error):
                presenter.presentExampleItemsListError(error)
            }
        }
    }
    
    func selectExampleItem(request: Example.Selection.Request) {
        
    }
    
}
