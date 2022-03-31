//
//  UserCoordinator.swift
//  GithubSearch
//
//  Created by Guru on 27/03/2022.
//

import UIKit

class UserCoordinator: Coordinator {
    weak var parentCoordinator:MainCoordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        moveToSearchUserPage()
    }
    
    func moveToSearchUserPage(){
        let vc = SearchViewController()
        vc.userCoordinator = self
        vc.navigationItem.setHidesBackButton(true, animated: true)
        navigationController.setNavigationBarHidden(true, animated: true)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func moveToUserPage(){
        let vc = UserViewController()
        vc.userCoordinator = self
        vc.navigationItem.setHidesBackButton(false, animated: false)
        navigationController.setNavigationBarHidden(false, animated: true)
        navigationController.pushViewController(vc, animated: true)
    }
}

