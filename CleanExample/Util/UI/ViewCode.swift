//
//  ViewCode.swift
//  CleanExample
//
//  Created by Eduardo Bocato on 06/02/20.
//  Copyright © 2020 Bocato. All rights reserved.
//

import UIKit

/// Defines the pattern for creating a ViewCode based layout
protocol ViewCodeConfigurator {
    /// Where you add all your subviews.
    func addSubviews()
    /// Where you should place your constraint related functions / setup.
    func constrainSubviews()
}
extension ViewCodeConfigurator {
    fileprivate func initLayout() {
        addSubviews()
        constrainSubviews()
    }
}

///
class CodedView: UIView, ViewCodeConfigurator {
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("This view cannot be instantiated from IB.")
    }
    
    // MARK: - Layout Setup
    
    func addSubviews() {
        fatalError("You should override this function in order to setup your CodedView.")
    }
    
    func constrainSubviews() {
        fatalError("You should override this function in order to setup your CodedView.")
    }
    
}

class CodedTableViewCell: UITableViewCell, ViewCodeConfigurator {
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("This view cannot be instantiated from IB.")
    }
    
    // MARK: - Layout Setup
    
    func addSubviews() {
        fatalError("You should override this function in order to setup your CodedView.")
    }
    
    func constrainSubviews() {
        fatalError("You should override this function in order to setup your CodedView.")
    }
    
}

