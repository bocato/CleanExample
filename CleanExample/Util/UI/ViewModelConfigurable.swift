//
//  ViewModelConfigurable.swift
//  CleanExample
//
//  Created by Eduardo Bocato on 10/02/20.
//  Copyright © 2020 Bocato. All rights reserved.
//

import Foundation

protocol ViewModelConfigurable {
    associatedtype ViewModel
    var viewModel: ViewModel? { get }
    func configure(with viewModel: ViewModel)
}
