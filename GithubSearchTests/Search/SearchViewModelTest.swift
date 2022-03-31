//
//  SearchViewModelTest.swift
//  GithubSearchTests
//
//  Created by Guru on 30/03/2022.
//

import XCTest
import RxSwift
import Swinject
@testable import GithubSearch

class SearchViewModelTest: XCTestCase {
    
    var sut:SearchViewModel?
    var repo:SearchRepositoryImpl?
    var userReq = "login"
    var dispose:DisposeBag?
    
    
    override func setUp() {
        super.setUp()
        repo = SearchRepositoryImpl()
        sut = SearchViewModel(searchRepository: repo!)
        dispose = DisposeBag()
    }
    
    override func tearDown() {
        sut = nil
        dispose = nil
        super.tearDown()
    }
    
    
    func test_fetch_users() {
       
        let sut = self.sut!
        
        let exp = expectation(description: "Fetch Users")
        
        sut.fetchUser(query: userReq)
        sut.userResponseRx.observe(on: MainScheduler.instance).subscribe(onNext: {  response in
            
            exp.fulfill()

            XCTAssertNotNil(response.items?[0].type == "user")
           
        }).disposed(by:dispose!)
        
        wait(for: [exp], timeout: 0.9)
    }
    

}
