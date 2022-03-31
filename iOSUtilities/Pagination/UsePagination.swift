//
//  UsePagination.swift
//  GithubSearch
//
//  Created by Guru on 30/03/2022.
//

open class UsePagination<Element:Hashable>{
    
    private var number_of_elements_per_page:Int
    private var pagination:PaginationClass<Element>?
    
    public init(no_of_elements per_page:Int){
        self.number_of_elements_per_page = per_page
        pagination = PaginationClass<Element>(no_of_elements: number_of_elements_per_page)
    }

    public func setUpInit(list_of items: [Element], useDataAction: @escaping () -> ()){
        pagination?.setUpInit(list_of: items, useDataAction: useDataAction)
    }
    
    public func scrollAndUpdate(afterScroll: @escaping () -> ()){
        pagination?.addMoreDataAndScrollDown()
        afterScroll()
    }
    
    public func getCurrentDataBank() -> [Element]{
        pagination?.databank ?? []
    }
    
    public func getDataBasedOnCurrentIndex() -> [Element]{
        pagination?.newCurrentAddition ?? []
    }
}
