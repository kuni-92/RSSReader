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
    

    var body: some View {
        VStack {
            Text("Content menu")
            Text("url is: \(settings.url)")
            Button {
                withAnimation {
                    xmlLoad()
                }
            } label: {
                Text("XMLファイル読み込み")
            }
        }
    }
    
    func xmlLoad() {
        guard let url = Bundle.main.url(forResource: "testAtom", withExtension: "xml") else {
            print("file not found.")
            return
        }
        guard let data = try? Data(contentsOf: url) else {
            print("load error.")
            return
        }
        let reader = AtomReader(data: data)
        reader.parse()
    }
}

struct RSSContentView_Previews: PreviewProvider {
    static var previews: some View {
        RSSContentView()
    }
}
