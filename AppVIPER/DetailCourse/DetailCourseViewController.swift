//
//  ViewController.swift
//  AppMVVM
//
//  Created by Igor on 22.02.2022.
//

import UIKit

// Методы вызываеются из Presenter
protocol DetailCourseViewInputProtocol: AnyObject {
    func displayCourseName(with title: String)
    func displayLessonsCount(with title: String)
    func displayTestsCount(with title: String)
    func displayImage(with data: Data)
    
    func displayColorForFavoriteButton(with status: Bool)
}

protocol DetailCourseViewOutputProtocol {
    init(view: DetailCourseViewInputProtocol)
    func showDetails()
    func likeButtonPressed()
}

class DetailCourseViewController: UIViewController {

    @IBOutlet var courseImageView: UIImageView!
    @IBOutlet var likeButton: UIButton!
    
    @IBOutlet var lessonsCountLabel: UILabel!
    @IBOutlet var testsCountLabel: UILabel!
    
    var course: Course!
    var presenter: DetailCourseViewOutputProtocol!
    
    let configurator: DetailCourseConfiguratorInputProtocol = DetailCourseConfigurator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self, and: course)
        presenter.showDetails()
    }
    
    @IBAction func likeButtonPressed() {
        presenter.likeButtonPressed()
    }
}

// MARK: - DetailCourseViewInputProtocol
extension DetailCourseViewController: DetailCourseViewInputProtocol {
    func displayCourseName(with title: String) {
        self.title = title
    }
    
    func displayLessonsCount(with title: String) {
        lessonsCountLabel.text = title
    }
    
    func displayTestsCount(with title: String) {
        testsCountLabel.text = title
    }
    
    func displayImage(with data: Data) {
        courseImageView.image = UIImage(data: data)
    }
    
    func displayColorForFavoriteButton(with status: Bool) {
        likeButton.tintColor = status ? .red : .gray
    }
}
