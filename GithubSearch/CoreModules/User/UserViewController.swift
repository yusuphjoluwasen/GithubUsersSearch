//
//  UserViewController.swift
//  GithubSearch
//
//  Created by Guru on 27/03/2022.
import UIKit
import iOSUtilities
import Swinject
import RxSwift

final class UserViewController: UIViewController {
    
    var contentView = UserView()
    weak var userCoordinator:UserCoordinator?
    let disposeBag = DisposeBag()
    let userViewModel:UserViewModel = Container.sharedContainer.resolve(UserViewModel.self)!
    var collectionClass = CompositionalCollectionView<UserDto,UserCell>()
    var cellData:[UserDto] = []{
        didSet{
            collectionClass.passDataToCollection(data: cellData)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initSetup()
        setUpActions()
        
    }
    
    override func loadView() {
        view = contentView
    }
    
    private func initSetup(){
        setUpCollectionView()
    }
    
    private func setUpCollectionView(){
        collectionClass.collectionview = contentView.collectionView
        contentView.collectionView.delegate = self
    }
}
