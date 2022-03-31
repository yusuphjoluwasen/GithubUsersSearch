//
//  Container.swift
//  GithubSearch
//
//  Created by Guru on 27/03/2022.
//

import Foundation
import Swinject
import SwinjectAutoregistration
import CoreData
import UIKit

extension Container {
 
    static let sharedContainer:Container = {
        let container  = Container()


         container.autoregister(MainCoordinator.self, initializer: {
            let navController = UINavigationController()
            return MainCoordinator(navigationController: navController)
         })

        container.autoregister(SearchViewModel.self, initializer: SearchViewModel.init)
        container.autoregister(SearchRepository.self, initializer: SearchRepositoryImpl.init)
        
        container.autoregister(UserViewModel.self, initializer: UserViewModel.init)
        return container
    }()
}

