//
//  CatDetailsView.swift
//  iCat
//
//  Created by Nimer Farahty on 19/07/2022.
//

import SwiftUI

struct CatDetailsView: View {
    
    let cat: Cat
    
    var body: some View {
        ScrollView {
            VStack{
                if let imageURL = cat.image {
                    AsyncImage(url: URL(string: imageURL.url)!) { image in
                        image.resizable().scaledToFit()
                        
                    } placeholder: {
                        ProgressView().frame(width: .infinity, height: 200, alignment: .center)
                    }
                    
                }
                
                Text(cat.name).font(.largeTitle).padding()
                Text(cat.description).font(.body)
                Spacer()
            }.padding()
           
        }
    }
}

struct CatDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CatDetailsView(cat: Cat.example)
    }
}
