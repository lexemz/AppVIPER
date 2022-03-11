//
//  DetailViewInteractor.swift
//  AppVIPER
//
//  Created by Igor on 11.03.2022.
//

protocol DetailCourseInteractorInputProtocol {
    init(presenter: DetailCourseInteractorOutputProtocol,
         course: Course)
}

protocol DetailCourseInteractorOutputProtocol: AnyObject {
    
}

class CourseDetailsInteractor: DetailCourseInteractorInputProtocol {
    unowned let presenter: DetailCourseInteractorOutputProtocol
    private let course: Course
    
    required init(presenter: DetailCourseInteractorOutputProtocol, course: Course) {
        self.presenter = presenter
        self.course = course
    }
}
