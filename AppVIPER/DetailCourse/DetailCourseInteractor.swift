//
//  DetailViewInteractor.swift
//  AppVIPER
//
//  Created by Igor on 11.03.2022.
//

protocol DetailCourseInteractorInputProtocol {
    var isFavorite: Bool { get }
    init(presenter: DetailCourseInteractorOutputProtocol,
         course: Course)
    func provideCourseDetails()
    func toggleLikeButton()
}

protocol DetailCourseInteractorOutputProtocol: AnyObject {
    func recevieDetailCourse(with detailCourse: DetailCourseData)
    func recevieFavoriteStatus(with status: Bool)
}

class CourseDetailsInteractor: DetailCourseInteractorInputProtocol {
    unowned let presenter: DetailCourseInteractorOutputProtocol
    
    var isFavorite: Bool {
        get {
            UDManager.shared.getDataUD(courseName: course.name)
        }
        set {
            UDManager.shared.saveDataUD(status: newValue, courseName: course.name)
        }
    }
    
    private let course: Course
    
    required init(presenter: DetailCourseInteractorOutputProtocol, course: Course) {
        self.presenter = presenter
        self.course = course
    }
    
    func provideCourseDetails() {
        let imageData = NetworkManager.shared.fetchImage(url: course.imageUrl)
        
        let detailCourseData = DetailCourseData(
            courseName: course.name,
            numberOfLessons: course.numberOfLessons,
            numberOfTests: course.numberOfTests,
            imageData: imageData,
            isFavorite: isFavorite
        )
        
        presenter.recevieDetailCourse(with: detailCourseData)
    }
    
    func toggleLikeButton() {
        isFavorite.toggle()
        presenter.recevieFavoriteStatus(with: isFavorite)
    }
}
