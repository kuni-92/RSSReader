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
        subtitle = ""
        link     = ""
        updated  = ""
        entry = AtomEntryModel()
    }

    var title: String
    var subtitle: String
    var link: String
    var updated: String
    var entry: AtomEntryModel
}

struct AtomEntryModel {
    
    init() {
        title   = ""
        link    = ""
        updated = ""
        content = ""
    }

    var title: String
    var link: String
    var updated: String
    var content: String
}
