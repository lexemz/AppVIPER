//
//  CourseTableViewCell.swift
//  AppMVVM
//
//  Created by Igor on 22.02.2022.
//

import UIKit

class CourseTableViewCell: UITableViewCell {
    func configure(with course: Course) {
        var content = defaultContentConfiguration()
        
        content.text = course.name
        
        content.secondaryText = """
                                Уроки: \(course.numberOfLessons)
                                Тесты: \(course.numberOfTests)
                                """
        
        guard let imageData = NetworkManager.shared.fetchImage(url: course.imageUrl) else { return }
        content.image = UIImage(data: imageData)
        
        contentConfiguration = content
    }
}
