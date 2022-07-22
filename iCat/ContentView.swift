//
//  ContentView.swift
//  iCat
//
//  Created by Nimer Farahty on 18/07/2022.
//

import SwiftUI


struct ContentView: View {
    
    @StateObject var vm = CatViewModel()
    
    var body: some View {
        NavigationView {
            Group {
                List(vm.cats) { cat in
                    NavigationLink{
                        CatDetailsView(cat: cat)
                    } label: {
                        CatListItemView(cat: cat)
                    }
                }
                
            }
            .navigationTitle("iCat")
            .task {
                await vm.fetchCats()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
