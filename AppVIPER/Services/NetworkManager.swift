//
//  NetworkManager.swift
//  AppMVVM
//
//  Created by Igor on 22.02.2022.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    private let apiLink = URL(string: "https://swiftbook.ru//wp-content/uploads/api/api_courses")!
    
    private init() {}
    
    func fetchCourses(completionHandler: @escaping (Result<[Course], Error>) -> Void) {
        URLSession.shared.dataTask(with: apiLink) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "")
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                let courses = try decoder.decode([Course].self, from: data)
                
                DispatchQueue.main.async {
                    completionHandler(.success(courses))
                }
                
            } catch let error {
                completionHandler(.failure(error))
            }
            
        }.resume()
    }
    
    func fetchImage(url: URL) -> Data? {
//        guard let url = URL(string: url) else { return nil }
        return try? Data(contentsOf: url)
    }
}
