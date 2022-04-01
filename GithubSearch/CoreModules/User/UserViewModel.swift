//
//  UserViewModel.swift
//  GithubSearch
//
//  Created by Guru on 27/03/2022.
//
import Swinject
import RxSwift
import iOSUtilities

class UserViewModel: BaseViewModel {
    
    static let sharedViewModel: UserViewModel = Container.sharedContainer.resolve(UserViewModel.self)!
    let getUserData = BehaviorSubject<String>(value: "")
    let usePagination = UsePagination<UserDto>(no_of_elements: 10)
    var usersFromSource:[User] = []{
        didSet{
            paginateUsers()
        }
    }
    var users:[UserDto] = []
    
    func mapUserDto(users list:[User]) -> [UserDto]{
        return list.map{ user in UserDto(login: user.login.orEmpty().capitalized, avatar_url: user.avatar_url.orEmpty(), type:  formatUserType(user: user.type))}
    }
    
    func sortUsers(listof users:[UserDto]) -> [UserDto]{
        return users.sorted { $0.login.lowercased() < $1.login.lowercased() }
    }
    
    func sortedUsers(listof users:[User]) -> [UserDto]{
        return sortUsers(listof: mapUserDto(users: users))
    }
    
    func paginateUsers(){
        usePagination.setUpInit(list_of:  sortedUsers(listof: usersFromSource)) { [weak self] in
            self?.setUpCurrentData()
        }
    }
                
    func setUpCurrentData(){
        users = usePagination.getCurrentDataBank()
    }
    
    func userScrollToTheEnd(){
        usePagination.scrollAndUpdate {  [weak self] in
            self?.setUpCurrentData()
        }
    }

    func formatUserType(user type:String?) -> String{
        return "Type: \(type.orEmpty())"
    }
}

