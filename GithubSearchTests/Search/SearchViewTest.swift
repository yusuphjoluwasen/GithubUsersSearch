//
//  SearchViewTest.swift
//  GithubSearchTests
//
//  Created by Guru on 31/03/2022.
//

import XCTest
@testable import GithubSearch

class SearchViewTest: XCTestCase {
    
    var searchView: SearchView?
    
    override func setUp() {
        searchView = SearchView()
    }
    
    override func tearDown() {
        searchView = nil
    }
    
    func test_title_label_text() {
        XCTAssertEqual(searchView?.titleLabel.text, "Welcome!")
    }
    
    func test_search_text_field_text() {
        XCTAssertEqual(searchView?.searchTextField.placeholder, "Enter a user name")
    }
    
    func test_button_text() {
        XCTAssertEqual(searchView?.button.titleLabel?.text, "Login")
    }
    
    
    
}
