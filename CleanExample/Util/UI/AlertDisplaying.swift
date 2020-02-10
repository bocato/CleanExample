//
//  AlertDisplaying.swift
//  CleanExample
//
//  Created by Eduardo Bocato on 10/02/20.
//  Copyright © 2020 Bocato. All rights reserved.
//

import UIKit

protocol AlertDisplaying {
    func display(_ data: AlertData, from controller: UIViewController)
}

struct AlertData {
    let title: String
    let message: String
}

final class AlertDisplayer: AlertDisplaying {
    
    func display(_ data: AlertData, from controller: UIViewController) {
        let alertController = UIAlertController(
            title: data.title,
            message: data.message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        controller.show(alertController, sender: self)
    }
    
}
