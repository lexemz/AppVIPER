//
//  CoursesTableConfigurator.swift
//  AppVIPER
//
//  Created by Igor on 12.03.2022.
//

import Foundation

protocol CoursesTableConfiguratorInputProtocol {
    func configure(with viewController: CoursesTableViewController)
}

class CoursesTableConfigurator: CoursesTableConfiguratorInputProtocol {
    func configure(with viewController: CoursesTableViewController) {
        let presenter = CoursesTablePresenter(view: viewController)
        let interactor = CourseTableInteractor(presenter: presenter)
        let router = CourseTableRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
