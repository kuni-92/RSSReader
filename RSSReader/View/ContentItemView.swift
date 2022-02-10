//
//  ContentItemView.swift
//  RSSReader
//  
//  Created by kunikuni03 on 2022/02/10
//  
//

import SwiftUI

struct ContentItemView: View {
    private let title: String
    private let updated: String
    
    init(title: String, updated: String) {
        self.title = title
        self.updated = updated
    }

    var body: some View {
        VStack {
            Text("\(title)")
                .font(.title)
            Text("\(updated)")
                .font(.caption)
        }
    }
}

struct ContentItemView_Previews: PreviewProvider {
    static var previews: some View {
        ContentItemView(title: "タイトル", updated: "2020/01/1")
    }
}
