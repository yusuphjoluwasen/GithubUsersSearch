//
//  UserControllerTest.swift
//  GithubSearchTests
//
//  Created by Guru on 31/03/2022.
//

import XCTest
@testable import GithubSearch

class UserControllerTest: XCTestCase {

    var sut:UserViewController?
    var viewmodel:UserViewModel?
    var users:[User]?
    var users_list_dto:[UserDto]?
    var cell:UserCell?
    
    override func setUp() {
        super.setUp()
        viewmodel = UserViewModel()
        sut = UserViewController()
        users =  StubGenerator().stubUsers()
        users_list_dto = viewmodel?.mapUserDto(users: users!) ?? []
        sut?.viewDidLoad()
    }
    
    override func tearDown() {
        viewmodel = nil
        users = nil
        users_list_dto = nil
        super.tearDown()
    }
    
    func test_user_data_is_empty_at_beginning(){
        XCTAssertTrue(sut?.cellData == [], "initially view controller cell data should be empty")
    }
    
    func test_user_get_first_data_from_viewmodel(){
        sut?.cellData = users_list_dto ?? []
        XCTAssertTrue(sut?.cellData == [], "view controller cell data should not be empty")
    }
    
    func test_not_has_a_collectionview(){
        XCTAssertNil(sut?.contentView.collectionView)
    }
    
    func test_has_a_collectionview(){
        XCTAssertNotNil(sut?.contentView.collectionView)
    }
    
    func test_collection_view_has_no_delegate(){
        XCTAssertNil(sut?.contentView.collectionView.delegate)
    }
    
    func test_collection_view_has_a_delegate(){
        sut?.viewDidLoad()
        XCTAssertNotNil(sut?.contentView.collectionView.delegate)
    }
    
    func test_collection_view_has_a_datasource(){
        sut?.viewDidLoad()
        XCTAssertNotNil(sut?.contentView.collectionView.dataSource)
    }
    
    func setUpCell(){
        let indexPath = IndexPath(row: 0, section: 0)
        sut?.contentView.collectionView.register(UserCell.self, forCellWithReuseIdentifier: "userCell")
        cell = sut?.contentView.collectionView.dequeueReusableCell(withReuseIdentifier: "userCell", for: indexPath) as? UserCell
    }
    
    func test_collection_view_cell_display_correct_data(){
        setUpCell()
        let userDTO = UserDto(login: "Login", avatar_url: "url", type: "User")
        cell?.populate(userDTO)
        XCTAssertTrue(cell?.titleLabel.text == "Login", "display correct text")
    }
}
