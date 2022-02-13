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
                .frame(maxWidth: .infinity, alignment: .leading)
            Text("\(updated)")
                .frame(maxWidth: .infinity, alignment: .trailing)
                .font(.caption)
        }
        .padding()
        .frame(width: 370, height: 80)
        .background(Color(red: 1.0, green: 0.95, blue: 0.9))
        .compositingGroup()
        .cornerRadius(5)
        .shadow(color: .gray, radius: 3, x: 10, y: 10)

    }
}

struct ContentItemView_Previews: PreviewProvider {
    static var previews: some View {
        ContentItemView(title: "タイトル", updated: "2020/01/1")
    }
}
