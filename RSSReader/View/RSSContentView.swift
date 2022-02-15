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
        ZStack {
            // Back ground color.
            LinearGradient(gradient: Gradient(colors: [.blue, .red, .white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea(edges: [.top])

            VStack {
                // Title area
                VStack {
                    Text("\(item.title)")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    Text("\(settings.url)")
                        .font(.caption)
                        .foregroundColor(.white)
                }
                .padding()
                // Content area
                VStack {
                    ScrollView {
                        ForEach(item.entry) { entry in
                            Button(action: {
                                isPresentedSafari = true
                                presentedURL = entry.link
                            }, label: {
                                ContentItemView(title: entry.title, updated: entry.updated)
                            })
                        }
                    }
                }
                .padding()
            }
        }
        .onAppear() {
            withAnimation() {
                item = xmlLoad() ?? AtomFeedModel()
            }
        }
        .sheet(isPresented: $isPresentedSafari, onDismiss: {isPresentedSafari = false}) {
            SafariView(url: $presentedURL)
        }
    }
    
    // Load Atom.xml
    func xmlLoad() -> AtomFeedModel? {
        print(settings.url)
        let sem = DispatchSemaphore.init(value: 0)
        var xmldata: Data?
        guard let url = URL(string: settings.url) else {
            return nil
        }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in

            xmldata = data ?? nil
            sem.signal()
        }
        task.resume()
        
        sem.wait()
        
        if xmldata == nil {
            return nil
        }
        let reader = AtomReader(data: xmldata!)
        return reader.parse()
    }
}

struct RSSContentView_Previews: PreviewProvider {
    static var previews: some View {
        RSSContentView()
    }
}
