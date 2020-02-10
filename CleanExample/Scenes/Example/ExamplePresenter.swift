//
//  ExamplePresenter.swift
//  CleanExample
//
//  Created by Eduardo Bocato on 06/02/20.
//  Copyright © 2020 Bocato. All rights reserved.
//

import UIKit

protocol ExamplePresentationLogic {
    func presentExampleItemsList(_ response: Example.List.Response)
    func presentExampleItemsListError(_ response: GetExampleItemsUseCaseError)
    func presentExampleItemsSelection(_ response: Example.Selection.Response)
}

final class ExamplePresenter: ExamplePresentationLogic {
    
    // MARK: - Private Properties
    
    weak var viewController: ExampleViewDisplayLogic?
    
    // MARK: - ExamplePresentationLogic
    
    func presentExampleItemsList(_ response: Example.List.Response) {
        let presentedItems = response.items.map {
            Example.List.ViewModel.Item(
                title: $0.title.capitalized,
                description: $0.description
            )
        }
        let viewModel = Example.List.ViewModel(items: presentedItems)
        viewController?.displayExampleItems(viewModel)
    }
    
    func presentExampleItemsListError(_ response: GetExampleItemsUseCaseError) {
        debugPrint(response)
        let errorModel = Example.List.Error(
            title: "Error",
            message: "Could not load example items."
        )
        viewController?.displayExampleItemsError(errorModel)
    }
    
    func presentExampleItemsSelection(_ response: Example.Selection.Response) {
        let viewModel = Example.Selection.ViewModel(
            title: response.title,
            message: response.description
        )
        viewController?.displayExampleItemsSelection(viewModel)
    }
    
}
