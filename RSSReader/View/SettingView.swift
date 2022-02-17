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
        ZStack {
            // Back ground color.
            LinearGradient(gradient: Gradient(colors: [.yellow, .white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea(edges: [.top])
            VStack {
                Text("Setting menu")
                    .foregroundColor(.gray)
                    .font(.title)
                    .padding()
                TextField("Atom URL", text: $url)
                    .frame(width: 400, height: 50)
                    .background()
                    .cornerRadius(10)
                    .padding()
                Button {
                    withAnimation {
                        settings.writeSetting(atomURL: url)
                    }
                } label: {
                    Text("Apply")
                }
                .foregroundColor(.white)
                .font(.title2)
                .frame(width: 200, height: 50)
                .background(.teal)
                .cornerRadius(10)
                .padding()
            }
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
            .environmentObject(SettingModel())
    }
}
