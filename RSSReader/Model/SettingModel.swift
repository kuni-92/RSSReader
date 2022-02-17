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
    private let atomSettingFileName = "atomURL.txt"

    init() {
        url = ""
        guard let settingURL = readSetting() else {
            return
        }
        url = settingURL
    }

    func readSetting() -> String? {
        let fileURL = getAtomSettingFileURL()

        guard let atomURL = try? String(contentsOf: fileURL) else {
            return nil
        }
        return atomURL
    }
    
    func writeSetting(atomURL: String) {
        let fileURL = getAtomSettingFileURL()
        
        do {
            try atomURL.write(to: fileURL, atomically: true, encoding: .utf8)
            self.url = atomURL
        } catch {
           print("URL write error: \(error)")
        }
    }
    
    private func getAtomSettingFileURL() -> URL {
        let fileManager = FileManager.default
        let tmpDir = fileManager.temporaryDirectory
        return tmpDir.appendingPathComponent(atomSettingFileName)
    }
}
