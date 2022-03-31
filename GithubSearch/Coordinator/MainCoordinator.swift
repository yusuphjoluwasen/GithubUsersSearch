//
//  MainCoordinator.swift
//  GithubSearch
//
//  Created by Guru on 27/03/2022.
//

import Foundation
import UIKit

class MainCoordinator: NSObject,Coordinator, UINavigationControllerDelegate {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        navigationController.delegate = self
        moveToSplashcreenView()
    }
    
    func moveToSplashcreenView(){
        childCoordinators.removeAll()
        let child = UserCoordinator(navigationController: navigationController)
        navigationController.setNavigationBarHidden(true, animated: true)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
  
    func popToRoot(){
        navigationController.popToRootViewController(animated: true)
    }
    
    func popOnce(){
        navigationController.popViewController(animated: true)
    }
    
    func childDidFinish(_ child: Coordinator?){
        for (index,coordinator) in childCoordinators.enumerated(){
            if coordinator === child {
                childCoordinators.remove(at: index)
            }
        }
    }
    
    func removeAllChildren(){
        for (index,_) in childCoordinators.enumerated(){
            childCoordinators.remove(at: index)
        }
    }
}
