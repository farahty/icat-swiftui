//
//  Cat.swift
//  iCat
//
//  Created by Nimer Farahty on 18/07/2022.
//

import Foundation


struct CatImage: Codable {
    var url: String
    var width, height : Int
}

struct Cat: Identifiable, Codable {
    var id, name : String
    var image: CatImage?
    var description : String
}



extension Cat {
    
    
    static var example = Cat(
        id: "just_id",
        name: "a cat name",
        image: CatImage(url: "https://cdn2.thecatapi.com/images/-d7GY-cPZ.jpg", width: 1204, height: 1445),
        description: "LaPerms are gentle and affectionate but also very active. Unlike many active breeds, the LaPerm is also quite"
    )
}
