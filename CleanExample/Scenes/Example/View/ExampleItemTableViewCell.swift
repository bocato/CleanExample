//
//  ExampleItemTableViewCell.swift
//  CleanExample
//
//  Created by Eduardo Bocato on 07/02/20.
//  Copyright © 2020 Bocato. All rights reserved.
//

import UIKit

final class ExampleItemTableViewCell: CodedTableViewCell, ViewModelConfigurable {

    // MARK: - Aliases
    
    typealias ViewModel = Example.List.ViewModel.Item
    
    // MARK: - Properties
       
    private(set) var viewModel: Example.List.ViewModel.Item?
    
    // MARK: - Layout Items
    
    private lazy var _titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.font = .systemFont(ofSize: 14, weight: .bold)
        return label
    }()
    
    private lazy var _descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 12, weight: .light)
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        return StackViewBuilder {
            $0.axis = .vertical
            $0.arrangedSubviews = [
                _titleLabel,
                _descriptionLabel
            ]
            $0.distribution = .fillProportionally
        }.build()
    }()
       
    // MARK: - Layout Setup
    
    override func addSubviews() {
        addSubview(stackView)
    }
    
    override func constrainSubviews() {
        stackView.anchor(
            top: topAnchor,
            left: leftAnchor,
            bottom: bottomAnchor,
            right: rightAnchor,
            topConstant: Metrics.Padding.default,
            leftConstant: Metrics.Padding.default,
            bottomConstant: Metrics.Padding.default,
            rightConstant: Metrics.Padding.default
        )
    }
    
    // MARK: - Configuration
    
    func configure(with viewModel: Example.List.ViewModel.Item) {
        self.viewModel = viewModel
        _titleLabel.text = viewModel.title
        _descriptionLabel.text = viewModel.description
    }
    
}
