//
//  ExampleView.swift
//  CleanExample
//
//  Created by Eduardo Bocato on 06/02/20.
//  Copyright © 2020 Bocato. All rights reserved.
//

import UIKit

final class ExampleView: CodedView {
    
    // MARK: - Layout Components
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.allowsSelection = false
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .lightGray
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.estimatedSectionFooterHeight = 0
        tableView.sectionFooterHeight = 0
        tableView.isHidden = true
        tableView.register(
            ExampleItemTableViewCell.self,
            forCellReuseIdentifier: ExampleItemTableViewCell.className
        )
        return tableView
    }()
    
    // MARK: - Initialization
    
    /// Initializes an ExampleView
    /// - Parameters:
    ///   - frame: the view frame
    ///   - tableViewDataSource: the inner tableView dataSource
    init(
        frame: CGRect = .zero,
        tableViewDataSource: UITableViewDataSource,
        tableViewDelegate: UITableViewDelegate
    ) {
        super.init(frame: frame)
        tableView.dataSource = tableViewDataSource
        tableView.delegate = tableViewDelegate
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - View Setup
    
    override func addSubviews() {
        addSubview(tableView)
    }
    
    override func constrainSubviews() {
        constrainTableView()
    }
    
    private func constrainTableView() {
        tableView.anchor(
            top: topAnchor,
            left: leftAnchor,
            bottom: bottomAnchor,
            right: rightAnchor
        )
    }
    
    // MARK: - Public API
    
    func reloadTableView() {
        tableView.reloadData()
    }
    
}
