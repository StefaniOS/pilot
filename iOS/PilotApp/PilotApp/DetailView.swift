//
//  DetailView.swift
//  PilotApp
//
//  Created by Stepan Vardanyan on 08.11.19.
//  Copyright © 2019 Stepan Vardanyan. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    
    @ObservedObject var imageLoader: ImageLoader
    @State private var showingAlert = false
    
    var item: Item
    
    init(item: Item) {
        self.item = item
        let imageStringUrl = "https://picsum.photos/id/\(item.id)/600/300"
        imageLoader = ImageLoader(stringUrl: imageStringUrl)
    }

    var body: some View {
        VStack(spacing: 64) {
            VStack(alignment: .leading) {
                Image(uiImage: imageLoader.data != nil
                    ? UIImage(data: imageLoader.data!)!
                    : UIImage())
                    .resizable()
                    .frame(height: 300)
                    .listRowInsets(EdgeInsets())
                Text(self.item.author)
                    .padding()
                    .font(.system(size: 32))
                Divider()
            }
            Button(action: {
                self.showingAlert = true
            }) {
                Text("Show Alert")
            }
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Source URL"), message: Text(item.url), dismissButton: .default(Text("OK")))
            }
            Spacer()
        }
    }
}
