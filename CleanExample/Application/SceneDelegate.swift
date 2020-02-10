//
//  SceneDelegate.swift
//  CleanExample
//
//  Created by Eduardo Bocato on 06/02/20.
//  Copyright © 2020 Bocato. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        setupRootViewController(windowScene: windowScene)
    }
    
    func setupRootViewController(windowScene: UIWindowScene?) {
        
        let presenter = ExamplePresenter()
        
        let itemsService = ItemsService()
        let getExampleItemsUseCase = GetExampleItemsUseCase(
            itemsService: itemsService
        )
        let interactor = ExampleInteractor(
            presenter: presenter,
            getExampleItemsUseCase: getExampleItemsUseCase
        )
        
        let viewController = ExampleViewController(
            interactor: interactor,
            alertDisplayer: AlertDisplayer()
        )
        presenter.viewController = viewController
        
        let frame = windowScene?.coordinateSpace.bounds ?? UIScreen.main.bounds
        window = UIWindow(frame: frame)
        window?.windowScene = windowScene
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
        
    }

}

