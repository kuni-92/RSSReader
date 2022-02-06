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
        }
    }
}

struct RSSContentView_Previews: PreviewProvider {
    static var previews: some View {
        RSSContentView()
    }
}
