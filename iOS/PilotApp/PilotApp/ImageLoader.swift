//
//  ImageLoader.swift
//  PilotApp
//
//  Created by Stepan Vardanyan on 08.11.19.
//  Copyright © 2019 Stepan Vardanyan. All rights reserved.
//

import Foundation
import Combine

class ImageLoader: ObservableObject {
    @Published var data: Data?
    
    init(stringUrl: String) {
        guard  let url = URL(string: stringUrl) else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.data = data
            }
        }.resume()
    }
}
