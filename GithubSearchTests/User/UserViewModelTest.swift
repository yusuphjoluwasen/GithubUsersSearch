//
//  UserViewModelTest.swift
//  GithubSearchTests
//
//  Created by Guru on 30/03/2022.
//

import XCTest
@testable import GithubSearch


class UserViewModelTest: XCTestCase {
    
    var sut:UserViewModel?
    var users:[User]?
    var users_list_dto:[UserDto]?
    
    override func setUp() {
        super.setUp()
        sut = UserViewModel()
        users =  StubGenerator().stubUsers()
        users_list_dto = sut?.mapUserDto(users: users!) ?? []
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_user_decoding_fail(){
        XCTAssertNil(users, "Could not decode and fetch user in the list")
    }
    
    func test_user_decoding_pass(){
        let user = users?[0]
        XCTAssertNotNil(user, "Could decode and fetch first user in the list")
    }
    
    func test_map_user_to_userdto(){
        let user_dto = users_list_dto?[0]
        
        XCTAssertNotNil(user_dto, "Could map and fetch first user in the list")
        XCTAssertTrue(user_dto?.login == "Regisphilibert", "first user name is regisphilibert")
    }
    
    func test_sort_users_dto(){
        let sortedusers_dto = sut?.sortUsers(listof: users_list_dto ?? [])
        let first_user_first_letter = sortedusers_dto?.first?.login.first?.lowercased()
        
        XCTAssertTrue(sortedusers_dto?.isEmpty != true, "sorted users list is not empty")
        XCTAssertTrue(first_user_first_letter == "b", "first user name starts with b")
    }
    
    func test_format_user_type(){
        let username = "User"
        XCTAssertTrue(sut?.formatUserType(user: username) == "Type: User", "formatting is valid")
    }
    
    func test_pagination(){
        sut?.usersFromSource = users ?? []
        sut?.setUpCurrentData()
        XCTAssertTrue(sut?.users != [], "data is not empty")
        XCTAssertTrue(sut?.users.count == 10, "data is not empty")
    }
}

class StubGenerator {
    func stubUsers() -> [User]? {
        guard let pathString = Bundle(for: type(of: self)).path(forResource: "content", ofType: "json") else {
            fatalError("content.json not found")
        }
        
        guard let jsonString = try? String(contentsOfFile: pathString, encoding: .utf8) else {
            fatalError("Unable to convert content.json to String")
        }
        
        guard let jsonData = jsonString.data(using: .utf8) else {
            fatalError("Unable to convert content.json to Data")
        }
        
        do {
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode(UserResponse.self, from: jsonData)
            return jsonData.items
        } catch {
            print("error:\(error)")
        }
        
        return nil
    }
}
