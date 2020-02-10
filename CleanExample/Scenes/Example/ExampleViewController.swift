//
//  ExampleViewController.swift
//  CleanExample
//
//  Created by Eduardo Bocato on 06/02/20.
//  Copyright © 2020 Bocato. All rights reserved.
//

import UIKit

protocol ExampleViewDisplayLogic: AnyObject {
    func displayExampleItems(_ viewModel: Example.List.ViewModel)
    func displayExampleItemsError(_ errorModel: Example.List.Error)
    func displayExampleItemsSelection(_ viewModel: Example.Selection.ViewModel)
}

final class ExampleViewController: UIViewController {
    
    // MARK: - Dependencies
    
    private let interactor: ExampleBusinessLogic
    private let alertDisplayer: AlertDisplaying
    
    // MARK: - Layout
    
    private lazy var customView: ExampleView = {
        let view = ExampleView(
            tableViewDataSource: self,
            tableViewDelegate: self
        )
        return view
    }()
    
    // MARK: - Properties
    
    private var viewModel: Example.List.ViewModel = Example.List.ViewModel(items: [])
    
    // MARK: - Initialization
    
    init(
        interactor: ExampleBusinessLogic,
        alertDisplayer: AlertDisplaying = AlertDisplayer()
    ) {
        self.interactor = interactor
        self.alertDisplayer = alertDisplayer
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor.loadExampleItemsList(request: .init())
    }
    
    override func loadView() {
        super.loadView()
        view = customView
    }
    
}

// MARK: - ExampleViewDisplayLogic

extension ExampleViewController: ExampleViewDisplayLogic {
    
    func displayExampleItems(_ viewModel: Example.List.ViewModel) {
        self.viewModel = viewModel
        customView.reloadTableView()
    }
    
    func displayExampleItemsError(_ errorModel: Example.List.Error) {
        alertDisplayer.display(errorModel, from: self)
    }
    
    func displayExampleItemsSelection(_ viewModel: Example.Selection.ViewModel) {
        alertDisplayer.display(viewModel, from: self)
    }
    
}

// MARK: - UITableViewDataSource

extension ExampleViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(ExampleItemTableViewCell.self, indexPath: indexPath)
        let itemCellModel = viewModel.items[indexPath.row]
        cell.configure(with: itemCellModel)
        return cell
    }
    
}

// MARK: - UITableViewDelegate

extension ExampleViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        interactor.selectExampleItem(request: .init(index: indexPath.row))
    }
    
}
