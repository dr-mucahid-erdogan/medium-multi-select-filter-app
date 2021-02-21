//
//  FilterView.swift
//  MediumTest
//
//  Created by Mücahid Erdoğan on 21.02.2021.
//

import SwiftUI

struct FilterView: View {
    @Binding var isFilterTapped: Bool
    
    @StateObject var filterViewModel = FilterViewModel.shared
    
    var body: some View {
        
        HStack {
            
            Spacer()
            
            Button("Done") {
                isFilterTapped.toggle()
            }
            
        }
        .padding()
        
        ScrollView {
            
            ForEach(filterViewModel.filter) { filter in
                
                HStack {
                    Image(systemName: filter.selected ? "checkmark.circle.fill" : "circle")
                    
                    Text(filter.name)
                    
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.vertical, 10)
                .contentShape(Rectangle())
                .onTapGesture {
                    filterViewModel.filterRowTapped(filterRow: filter)
                }
                
            }
            
        }
        
    }
}
