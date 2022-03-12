//
//  CoursesTableInteractor.swift
//  AppVIPER
//
//  Created by Igor on 12.03.2022.
//

protocol CourseTableInteractorInputProtocol {
    func fetchCourses()
    init(presenter: CourseTableInteractorOutputProtocol)
}

protocol CourseTableInteractorOutputProtocol: AnyObject {
    func coursesDidRecive(with dataStore: CoursesTableDataStore)
}

class CourseTableInteractor: CourseTableInteractorInputProtocol {
    unowned let presenter: CourseTableInteractorOutputProtocol!
    
    required init(presenter: CourseTableInteractorOutputProtocol) {
        self.presenter = presenter
    }
    
    func fetchCourses() {
        NetworkManager.shared.fetchCourses { result in
            switch result {
            case .success(let courses):
                let dataStore = CoursesTableDataStore(courses: courses)
                self.presenter.coursesDidRecive(with: dataStore)
            case .failure(let error):
                print(error)
            }
        }
    }
}
