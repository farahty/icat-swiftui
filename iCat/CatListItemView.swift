//
//  CatListItemView.swift
//  iCat
//
//  Created by Nimer Farahty on 18/07/2022.
//

import SwiftUI

struct CatListItemView: View {
    
    var cat:Cat
    
    var body: some View {
        HStack ( alignment: .top ) {
        
        if let image = cat.image {
            AsyncImage(url: URL(string: image.url)!) { imageUI in
                imageUI
                    .resizable()
                    .scaledToFill()
                    .frame(width: 120, height: 120, alignment: .center).clipped()
                
            } placeholder: {
                ProgressView()
                    .frame(width: 120, height: 120, alignment: .center)
            }
        }
        
        VStack (alignment: .leading) {
            Text(cat.name).font(.headline).padding(.bottom, 0.01)
            Text(cat.description).lineLimit(2).font(.body)
        }.padding(1)
    }
    }
}

struct CatListItemView_Previews: PreviewProvider {
    static var previews: some View {
        CatListItemView(cat: Cat.example)
    }
}
