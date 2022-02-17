//
//  RSSView.swift
//  RSSReader
//  
//  Created by kunikuni03 on 2022/02/05
//  
//

import SwiftUI

struct RSSView: View {
    @StateObject var settings = SettingModel()
    var body: some View {
        TabView {
            RSSContentView().tabItem {
                Text("News")
                Image(systemName: "doc")
            }
            SettingView().tabItem {
                Text("Settings")
                Image(systemName: "slider.horizontal.3")
            }
        }
        .environmentObject(settings)
    }

}

struct RSSView_Previews: PreviewProvider {
    static var previews: some View {
        RSSView()
    }
}
