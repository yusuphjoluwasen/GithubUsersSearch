//
//  Coordinator.swift
//  GithubSearch
//
//  Created by Guru on 27/03/2022.
//

import Foundation
import UIKit

protocol Coordinator :AnyObject{
  var childCoordinators: [Coordinator] { get set }
  var navigationController: UINavigationController { get set }
  func start()
}
