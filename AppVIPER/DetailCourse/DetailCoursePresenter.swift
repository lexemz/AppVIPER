//
//  DetailCoursePresenter.swift
//  AppVIPER
//
//  Created by Igor on 11.03.2022.
//

import Foundation

struct DetailCourseData {
    let courseName: String
    let numberOfLessons: Int
    let numberOfTests: Int
    let imageData: Data?
    
    let isFavorite: Bool
}

class DetailCoursePresenter: DetailCourseViewOutputProtocol {
    unowned let view: DetailCourseViewInputProtocol
    var interactor: DetailCourseInteractorInputProtocol!
    
    required init(view: DetailCourseViewInputProtocol) {
        self.view = view
    }
    
    func showDetails() {
        interactor.provideCourseDetails()
    }
    
    func likeButtonPressed() {
        interactor.toggleLikeButton()
    }
}

// MARK: - DetailCourseInteractorOutputProtocol
extension DetailCoursePresenter: DetailCourseInteractorOutputProtocol {
    func recevieDetailCourse(with detailCourse: DetailCourseData) {
        view.displayCourseName(with: detailCourse.courseName)
        view.displayLessonsCount(with: "\(detailCourse.numberOfLessons) - Lessons count")
        view.displayTestsCount(with: "\(detailCourse.numberOfTests) - Tests count")
        
        view.displayColorForFavoriteButton(with: detailCourse.isFavorite) // Первичное отображение
        
        guard let imageData = detailCourse.imageData else { return }
        view.displayImage(with: imageData)
    }
    
    func recevieFavoriteStatus(with status: Bool) {
        view.displayColorForFavoriteButton(with: status) // Повторное отображение (при нажатии)
    }
}
