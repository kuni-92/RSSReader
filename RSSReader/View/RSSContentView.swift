//
//  RSSContentView.swift
//  RSSReader
//  
//  Created by kunikuni03 on 2022/02/05
//  
//

import SwiftUI

struct RSSContentView: View {
    @EnvironmentObject var settings :SettingModel
    @State var item = AtomFeedModel()

    var body: some View {
        ScrollView {
            // Title area
            VStack{
                Text("\(item.title)")
                    .font(.largeTitle)
                Text("\(item.link)")
                    .font(.caption)
            }
            .padding()
            // Content area
            VStack {
                ContentItemView(title: item.entry.title, updated: item.entry.updated)
            }
            .padding()
        }
        .onAppear() {
            withAnimation() {
                item = xmlLoad()!
            }
        }
    }
    
    // Load Atom.xml
    func xmlLoad() -> AtomFeedModel? {
        guard let url = Bundle.main.url(forResource: "testAtom", withExtension: "xml") else {
            print("file not found.")
            return nil
        }
        guard let data = try? Data(contentsOf: url) else {
            print("load error.")
            return nil
        }
        let reader = AtomReader(data: data)
        return reader.parse()
    }
}

struct RSSContentView_Previews: PreviewProvider {
    static var previews: some View {
        RSSContentView()
    }
}
