//
//  FilterViewModel.swift
//  MediumTest
//
//  Created by Mücahid Erdoğan on 21.02.2021.
//

import Foundation

class FilterViewModel: ObservableObject {
    static let shared = FilterViewModel()
    
    init () {
        
    }
    
    @Published var filter = [
        FilterModel(id: 0, name: "Chicage Bulls", selected: false),
        FilterModel(id: 1, name: "Cleveland Cavaliers", selected: false),
        FilterModel(id: 2, name: "Los Angeles Lakers", selected: false),
        FilterModel(id: 3, name: "Miami Heat", selected: false),
        FilterModel(id: 4, name: "San Antonio Spurs", selected: false)
    ]
    
    func filterRowTapped (filterRow: FilterModel) {
        
        self.filter[filterRow.id].selected.toggle()
        
    }
    
    func filterReset() {
        
        for element in filter {
            if element.selected {
                filterRowTapped(filterRow: element)
            }
        }
        
    }
    
}
