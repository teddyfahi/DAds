//
//  Repository.swift
//  DAds
//
//  Created by Teddy Falsen Hiis on 25/03/2023.
//

import Foundation


class Repository: ObservableObject {
    
    @Published var items: [Item] = []
    private let jsonUrl: String = "https://gist.githubusercontent.com/baldermork/6a1bcc8f429dcdb8f9196e917e5138bd/raw/discover.json"
    
    func loadData() async {
        guard let url = URL(string: jsonUrl) else {
            print("The url is invalid or broken")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                DispatchQueue.main.async {
                    self.items = decodedResponse.items
                }
            }
        } catch {
            print("Fetching data failed")
        }
    }
}
