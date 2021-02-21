//
//  ContentView.swift
//  MediumTest
//
//  Created by Mücahid Erdoğan on 21.02.2021.
//

import SwiftUI

struct ContentView: View {
    @State var isFilterTapped = false
    
    @StateObject var filterViewModel = FilterViewModel.shared
    
    var body: some View {
        
        VStack {
            
            HStack(spacing: 40) {
                
                Button("Choose") {
                    isFilterTapped.toggle()
                }
                .padding(.horizontal)
                .padding(.vertical, 10)
                .background(Color.red)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                
                Button("Reset") {
                    filterViewModel.filterReset()
                }
                .padding(.horizontal)
                .padding(.vertical, 10)
                .background(Color.red)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                
            }
            
            VStack(alignment: .leading) {
                Text("Chosen teams")
                    .padding()
                
                ForEach(filterViewModel.filter) { filter in
                    if filter.selected {
                        Text("- \(filter.name)")
                            .padding()
                    }
                }
            }
            
        }
        .sheet(isPresented: $isFilterTapped, content: {
            FilterView(isFilterTapped: $isFilterTapped)
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
