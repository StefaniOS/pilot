//
//  Item.swift
//  PilotApp
//
//  Created by Stepan Vardanyan on 08.11.19.
//  Copyright © 2019 Stepan Vardanyan. All rights reserved.
//

import Foundation

struct Item: Identifiable, Decodable {
    let id, author, url: String
}
