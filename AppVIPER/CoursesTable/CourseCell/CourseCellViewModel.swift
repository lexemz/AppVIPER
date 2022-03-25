//
//  CourseCellViewModel.swift
//  AppVIPER
//
//  Created by Igor on 12.03.2022.
//

import Foundation

// Протокол для определения секций таблицы
protocol CourseSectionViewModelProtocol {
    var rows: [CourseCellViewModelProtocol] { get }
}

class CourseSectionViewModel: CourseSectionViewModelProtocol {
    var rows: [CourseCellViewModelProtocol] = []
}

protocol CourseCellViewModelProtocol {
    var cellIdentifier: String { get }
    var cellHeight: Double { get }
    var courseName: String { get }
    var imageData: Data? { get }
    
    init(course: Course)
}

class CourseCellViewModel: CourseCellViewModelProtocol {
    var cellIdentifier: String {
        "CourseCell"
    }
    
    var cellHeight: Double {
        100
    }
    
    var courseName: String {
        course.name
    }
    
    var imageData: Data? {
        NetworkManager.shared.fetchImage(url: course.imageUrl)
    }
    
    private let course: Course
    
    required init(course: Course) {
        self.course = course
    }
}
