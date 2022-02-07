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
    
    // When parsing the start tag.
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        print("When parsing the start tagName: \(elementName)")
    }
    
    // When parsing the element.
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        print("When parsing the element: \(string)")
    }
    
    // When parsing the end tag.
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        print("When parsing the end tagName: \(elementName)")
    }

}
