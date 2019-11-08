//
//  NetworkManager.swift
//  PilotApp
//
//  Created by Stepan Vardanyan on 08.11.19.
//  Copyright © 2019 Stepan Vardanyan. All rights reserved.
//

import Combine
import SwiftUI

class NetworkManager: ObservableObject {
    @Published var items: [Item] = []
    
    let apiStringUrl = "https://picsum.photos/v2/list?page=2&limit=50"
    
    func fetchItems() {
        guard  let url = URL(string: apiStringUrl) else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.items = try! JSONDecoder().decode([Item].self, from: data)
            }
        }.resume()
    }
    
    func reloadItems() {
        items = []
        fetchItems()
    }
}
