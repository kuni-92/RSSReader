//
//  AtomFeedModel.swift
//  RSSReader
//  
//  Created by kunikuni03 on 2022/02/08
//  
//

import Foundation

struct AtomFeedModel {
    
    init() {
        title    = ""
        link     = ""
        entry = [AtomEntryModel]()
    }

    var title: String
    var link: String
    var entry: [AtomEntryModel]
}

struct AtomEntryModel: Identifiable {
    var id = UUID()
    
    init() {
        title   = ""
        link    = ""
        updated = ""
    }

    var title: String
    var link: String
    var updated: String
}
