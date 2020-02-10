//
//  ItemsService.swift
//  CleanExample
//
//  Created by Eduardo Bocato on 10/02/20.
//  Copyright © 2020 Bocato. All rights reserved.
//

import Foundation

enum ItemsServiceError: Error {
    case serialization(_ error: Error)
}

protocol ItemsServiceProvider {
    func getItems(then: @escaping (Result<[ItemEntity], ItemsServiceError>) -> Void)
}

final class ItemsService: ItemsServiceProvider {
    
    // Simulating a service...
    func getItems(then: @escaping (Result<[ItemEntity], ItemsServiceError>) -> Void) {
        let jsonData = """
        {
            [
                {
                    "id": 1,
                    "name": "Item 1"
                    "description": "Item 1 description."
                },
                {
                    "id": 2,
                    "name": "Item 2"
                    "description": "Item 2 description."
                },
                {
                    "id": 3,
                    "name": "Item 3"
                    "description": "Item 3 description."
                }
            ]
        }
        """.data(using: .utf8)!
        do {
            let value = try JSONDecoder().decode([ItemEntity].self, from: jsonData)
            DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
                then(.success(value))
            }
        } catch {
            then(.failure(.serialization(error)))
        }
        
    }
    
}
