//
//  PaginationClass.swift
//  GithubSearch
//
//  Created by Guru on 27/03/2022.
//

import UIKit

class PaginationClass<Element>{
    
    private var current_index = 0
    private var number_of_elements_per_page = 0
    private var max_item = 0
    private var dict: [Int:[Element]] = [:]
    
    init(no_of_elements per_page:Int){
        self.number_of_elements_per_page = per_page
    }
    
    //Properties To be exposed
    public var databank:[Element] = []
    public var newCurrentAddition:[Element] = []
    
    private func cleanDataBank(){
        databank = []
        newCurrentAddition = []
        max_item = 0
        current_index = 0
        dict = [:]
    }
    
    private func buildDictionaryFromList(list:[Element]) -> [Int:[Element]]{
        var emptyDictionary =  [Int: [Element]]()
        var increment = 0
        var dictIndex = 0
        var helperList:[Element] = []
        list.forEach { item in
            
            helperList.append(item)
            increment += 1
            if increment == number_of_elements_per_page{
                
                emptyDictionary[dictIndex] = helperList
                increment = 0
                helperList = []
                dictIndex += 1
            }
        }
        return emptyDictionary
    }
    
    private func builddict(from list:[Element]) -> [Int:[Element]]{
        return buildDictionaryFromList(list: list)
    }
    
    private func getElementsFromDict(basedon position:Int) -> [Element]{
        return dict[position] ?? []
    }
    
    private func setMaxNumberOfItems(_ number:Int){
        max_item = number
    }
    
    private func addBasedOnIndex(index:Int){
        let newelements = getElementsFromDict(basedon: index)
        newCurrentAddition = newelements
        databank.append(contentsOf: newelements)
    }
  
    private func updateDataBankForTheFirstTime(){
        addBasedOnIndex(index: 0)
    }
    
    private func addToDataBank(){
        current_index += 1
        addBasedOnIndex(index: current_index)
    }
    
    //its not removing per say its just basically updating the current data box
    private func removeBasedOnIndex(index:Int){
        let newelements = getElementsFromDict(basedon: index)
        newCurrentAddition = newelements
    }
    
    private func removeFromDataBank(){
        current_index -= 1
        removeBasedOnIndex(index:current_index)
    }
    
    //it has no effect on databank, only on new current addition
    private func removeDataAndScrollUp(){
        if current_index > 0{
            removeFromDataBank()
        }
    }

    //Method To be exposed
    public func addMoreDataAndScrollDown(){
        print(current_index)
        print(max_item)
        if current_index < max_item - 1{
            addToDataBank()
        }
    }
    
    public func getMaxNumberOfItems(_ number:Int) -> Int{
        return max_item
    }
    
    public func setUpInit(list_of items: [Element], useDataAction: @escaping () -> ()){
        cleanDataBank()
        guard items.count > number_of_elements_per_page else {
            newCurrentAddition = items
            databank = items
            useDataAction()
            return
        }
       
        let items = builddict(from: items)
        max_item = items.count
        dict = items
        updateDataBankForTheFirstTime()
        useDataAction()
    }
}
