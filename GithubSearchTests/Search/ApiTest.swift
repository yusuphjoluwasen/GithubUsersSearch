//
//  ApiTest.swift
//  GithubSearchTests
//
//  Created by Guru on 29/03/2022.
//

import XCTest
import Foundation
import RxSwift
@testable import GithubSearch

class APIServiceTests: XCTestCase {
    
    var sut:SearchRepositoryImpl?
    var userReq:UserRequest?
    var dispose:DisposeBag?
    
    
    override func setUp() {
        super.setUp()
        sut = SearchRepositoryImpl()
        userReq = UserRequest(value: "login")
        dispose = DisposeBag()
      
    }
    
    override func tearDown() {
        sut = nil
        userReq = nil
        dispose = nil
        super.tearDown()
    }
    
    
    func test_fetch_users() {
       
        let sut = self.sut!
        
        let exp = expectation(description: "Fetch Users")
        
        sut.fetchUser(request: userReq!).observe(on: MainScheduler.instance).subscribe(onNext: {  response in
            
            exp.fulfill()

            XCTAssertNotNil(response)
           
        }).disposed(by:dispose! )
        
        wait(for: [exp], timeout: 0.9)
    }
}
