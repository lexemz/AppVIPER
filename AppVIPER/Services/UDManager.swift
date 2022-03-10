//
//  UserDefaultsManager.swift
//  AppMVVM
//
//  Created by Igor on 22.02.2022.
//

import Foundation

class UDManager {
    static let shared = UDManager()
    
    private init() {}
    
    func saveDataUD(status: Bool, courseName: String) {
        UserDefaults.standard.set(status, forKey: courseName)
    }
    
    func getDataUD(courseName: String) -> Bool {
        UserDefaults.standard.bool(forKey: courseName)
    }
}
