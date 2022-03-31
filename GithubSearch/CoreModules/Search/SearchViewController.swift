//
//  SearchViewViewController.swift
//  GithubSearch
//
//  Created by Guru on 27/03/2022.
//
import UIKit
import RxGesture
import RxSwift
import Swinject

final class SearchViewController:BaseViewController {
    
    let searchViewModel:SearchViewModel = Container.sharedContainer.resolve(SearchViewModel.self)!
    weak var userCoordinator:UserCoordinator?
    weak var delegate:SearchControllerDelegate?
    let contentView = SearchView()
    var searchValue = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpObserversForViewModel(baseViewModel: searchViewModel)
        setUpActions()
        setUpDelegates()
    }
    
    override func loadView() {
        view = contentView
    }
    
    func setUpDelegates(){
        delegate = self
    }
}
