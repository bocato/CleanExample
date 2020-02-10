//
//  UITableViewExtension.swift
//  CleanExample
//
//  Created by Eduardo Bocato on 10/02/20.
//  Copyright © 2020 Bocato. All rights reserved.
//

import UIKit

extension UITableView {
    
    func dequeue<T: UITableViewCell>(_ reusable: T.Type = T.self, indexPath: IndexPath) -> T {
        guard let cell = self.dequeueReusableCell(withIdentifier: T.className, for: indexPath) as? T else {
            fatalError("Cell \(T.className) is not registered - call tableView.register(Cell.Type) to register first before using.")
        }
        return cell
    }
    
}
