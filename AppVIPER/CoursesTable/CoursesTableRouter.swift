//
//  CoursesTableRouter.swift
//  AppVIPER
//
//  Created by Igor on 12.03.2022.
//

import Foundation

protocol CourseTableRouterInputProtocol {
    init(viewController : CoursesTableViewController)
    func openDetailCourseViewController(with course: Course)
}

class CourseTableRouter: CourseTableRouterInputProtocol {
    unowned let viewController: CoursesTableViewController
    
    required init(viewController: CoursesTableViewController) {
        self.viewController = viewController
    }
    
    func openDetailCourseViewController(with course: Course) {
        viewController.performSegue(withIdentifier: "ShowDetails", sender: course)
    }
}
