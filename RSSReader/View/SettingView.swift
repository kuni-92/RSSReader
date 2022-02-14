//
//  SettingView.swift
//  RSSReader
//  
//  Created by kunikuni03 on 2022/02/05
//  
//

import SwiftUI

struct SettingView: View {
    @EnvironmentObject var settings :SettingModel
    @State private var url: String = ""

    var body: some View {
        VStack {
            Text("Setting menu")
            Text("RSS URL is: \(settings.url)")
            TextField("RSS/Atom URL", text: $url)
            Button {
                withAnimation {
                    settings.url = url
                }
            } label: {
                Text("Apply")
            }
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
            .environmentObject(SettingModel("http://localhost/atom.xml"))
    }
}
