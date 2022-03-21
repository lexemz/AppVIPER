//
//  UserDefaultsManager.swift
//  AppMVVM
//
//  Created by Igor on 22.02.2022.
//

import Foundation

class UserDefaultsManager {
    static let shared = UserDefaultsManager()
    
    private init() {}
    
    func setDataUD(status: Bool, courseName: String) {
        UserDefaults.standard.set(status, forKey: courseName)
    }
    
    func getDataUD(courseName: String) -> Bool {
        UserDefaults.standard.bool(forKey: courseName)
    }
}
