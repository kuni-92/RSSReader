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
    @State private var item: AtomFeedModel = AtomFeedModel()
    @State private var isPresentedSafari: Bool = false
    @State private var presentedURL: String = ""

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
                ForEach(item.entry) { entry in
                    Button(action: {
                        isPresentedSafari = true
                        presentedURL = entry.link
                    }, label: {
                        ContentItemView(title: entry.title, updated: entry.updated)
                    })
                }
            }
            .padding()
        }
        .onAppear() {
            withAnimation() {
                item = xmlLoad()!
            }
        }
        .sheet(isPresented: $isPresentedSafari, onDismiss: {isPresentedSafari = false}) {
            SafariView(url: $presentedURL)
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
