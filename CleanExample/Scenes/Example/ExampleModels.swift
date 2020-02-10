//
//  ExampleModels.swift
//  CleanExample
//
//  Created by Eduardo Bocato on 06/02/20.
//  Copyright © 2020 Bocato. All rights reserved.
//

import Foundation

enum Example {
    
    enum List {
        struct Request {}
        struct Response {
            let items: [ExampleItem]
        }
        struct ViewModel {
            let items: [Item]
            struct Item {
                let title: String
                let description: String
            }
        }
        typealias Error = AlertData
    }
    
    enum Selection {
        struct Request {
            let index: Int
        }
        typealias Response = ExampleItem
        typealias ViewModel = AlertData
    }
    
}
