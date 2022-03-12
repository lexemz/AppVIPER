//
//  CourseTableViewCell.swift
//  AppMVVM
//
//  Created by Igor on 22.02.2022.
//

import UIKit

protocol CellViewModelRepresentable {
    var viewModel: CourseCellViewModelProtocol? { get }
}

class CourseTableViewCell: UITableViewCell, CellViewModelRepresentable {
    var viewModel: CourseCellViewModelProtocol? {
        didSet {
            updateView()
        }
    }
    
    private func updateView() {
        guard let viewModel = viewModel as? CourseCellViewModel else { return }
        
        var content = defaultContentConfiguration()
        content.text = viewModel.courseName
        guard let imageData = viewModel.imageData else { return }
        content.image = UIImage(data: imageData)
        contentConfiguration = content
    }
}
