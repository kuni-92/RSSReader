//
//  AtomReader.swift
//  RSSReader
//  
//  Created by kunikuni03 on 2022/02/06
//  
//

import Foundation

class AtomReader: NSObject {
    
    private var parser: XMLParser!
    
    init(data: Data) {
        self.parser = XMLParser(data: data)
        super.init()
        parser.delegate = self
    }
    
    // Parse XML data
    func parse() {
        guard parser.parse() else {
            print("Parse XML file error. Perser is not defined.")
            return
        }
    }
}

extension AtomReader: XMLParserDelegate {
    
    func parserDidStartDocument(_ parser: XMLParser) {
        print("Start to parse for Atom file.")
    }
    
    func parserDidEndDocument(_ parser: XMLParser) {
        print("End to parse for Atom file.")
    }
}
