//
//  ContentView.swift
//  PilotApp
//
//  Created by Stepan Vardanyan on 08.11.19.
//  Copyright © 2019 Stepan Vardanyan. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List (networkManager.items) {item in
                NavigationLink(destination: DetailView(item: item)) {
                    ListItemView(item: item)
                }
            }
            .navigationBarTitle(Text("Home"), displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                self.networkManager.reloadItems()
        }, label: {
            Image(systemName: "arrow.2.circlepath")
        }) )
        }.onAppear {
            self.networkManager.fetchItems()
        }
    }
}

struct ListItemView: View {
    
    @ObservedObject var imageLoader: ImageLoader
    
    let item: Item
    
    init(item: Item) {
        self.item = item
        let imageStringUrl = "https://picsum.photos/id/\(item.id)/600/300"
        imageLoader = ImageLoader(stringUrl: imageStringUrl)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(uiImage: imageLoader.data != nil
                ? UIImage(data: imageLoader.data!)!
                : UIImage())
                .resizable()
                .frame(height: 200)
                .listRowInsets(EdgeInsets())
            Text(self.item.author)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
