//
//  API.swift
//  iCat
//
//  Created by Nimer Farahty on 18/07/2022.
//

import Foundation



enum APIError: Error {
    case WrongURL(String), NotReachable(String), ParsingError(String), Unknown(String)
}

enum Constents {
    static let endpoint = "https://api.thecatapi.com/v1/breeds"
    
    // not used
    static let apiKey = "ffdfcec6-18ca-46b0-a513-2ca63feb2056"
}


class API {
    
    
    static let shared = API()
    
    func fetch<T:Codable>( from urlString: String ) async throws -> T {
        
        guard let url = URL(string: urlString) else {
            throw APIError.WrongURL("failed to build url from string \(urlString)")
        }
        
        guard let (data,_) = try? await URLSession.shared.data(from: url) else {
            throw APIError.NotReachable("failed to fetch from url \(urlString)")
        }
        
        
        guard let decodedData = try? JSONDecoder().decode(T.self, from: data) else {
            throw APIError.ParsingError("failed to parse data from url \(urlString)")
        }
        
        
        return decodedData
        
    }
    
}
