//
//  CatViewModel.swift
//  iCat
//
//  Created by Nimer Farahty on 21/07/2022.
//

import Foundation

@MainActor
class CatViewModel: ObservableObject {
    
    @Published private(set) var cats = [Cat]()
    @Published private(set) var error:APIError? = nil
    @Published private(set) var isLoading = false
    
    func fetchCats()  async  {
        do {
            isLoading = true
            cats = try await API.shared.fetch(from: Constents.endpoint)
        } catch is APIError {
            self.error = error
            isLoading = false
        } catch {
            self.error = APIError.Unknown(error.localizedDescription)
            isLoading = false
        }
    }
    
}
