//
//  DetailCourseConfigurator.swift
//  AppVIPER
//
//  Created by Igor on 11.03.2022.
//

protocol DetailCourseConfiguratorInputProtocol {
    func configure(with view: DetailCourseViewController, and course: Course)
}

class DetailCourseConfigurator: DetailCourseConfiguratorInputProtocol {
    func configure(with view: DetailCourseViewController, and course: Course) {
        let presenter = DetailCoursePresenter(view: view)
        let interactor = CourseDetailsInteractor(presenter: presenter, course: course)
        
        view.presenter = presenter
        presenter.interactor = interactor
    }
}
