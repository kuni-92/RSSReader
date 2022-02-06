//
//  SettingModel.swift
//  RSSReader
//  
//  Created by kunikuni03 on 2022/02/05
//  
//

import Foundation

class SettingModel: ObservableObject {
    @Published var url: String
    
    init(_ url: String) {
        self.url = url
    }
    
    func GetURL() -> URL? {
        return URL(string: self.url)
    }
}
