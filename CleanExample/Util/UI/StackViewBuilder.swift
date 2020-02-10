//
//  StackViewBuilder.swift
//  CleanExample
//
//  Created by Eduardo Bocato on 10/02/20.
//  Copyright © 2020 Bocato. All rights reserved.
//

import UIKit

// Helper class simplify building StackViews
final class StackViewBuilder {
    
    var axis: NSLayoutConstraint.Axis = .vertical
    var alignment: UIStackView.Alignment = .fill
    var spacing: CGFloat = 0.0
    var distribution: UIStackView.Distribution = .fillProportionally
    var arrangedSubviews: [UIView] = []
    
    init(buildClosure: (StackViewBuilder) -> Void) {
        buildClosure(self)
    }
    
    func build() -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: arrangedSubviews)
        stackView.axis = axis
        stackView.alignment = alignment
        stackView.spacing = spacing
        stackView.distribution = distribution
        return stackView
    }
}
