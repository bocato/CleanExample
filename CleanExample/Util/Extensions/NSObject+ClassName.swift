//
//  NSObject+ClassName.swift
//  CleanExample
//
//  Created by Eduardo Bocato on 07/02/20.
//  Copyright © 2020 Bocato. All rights reserved.
//

import Foundation

extension NSObject {
    
    /// String describing the class name.
    static var className: String {
        return String(describing: self)
    }
    
}
