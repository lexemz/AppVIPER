//
//  CoursesTableViewController.swift
//  AppMVVM
//
//  Created by Igor on 22.02.2022.
//

import UIKit

protocol CourseTableViewInputProtocol: AnyObject {
    func reloadData(for section: CourseSectionViewModel)
}

protocol CourseTableViewOutputProtocol {
    init(view: CourseTableViewInputProtocol)
    func viewDidLoad()
    func didTapCell(at indexPath: IndexPath)
}

class CoursesTableViewController: UITableViewController {
    var presenter: CourseTableViewOutputProtocol!
    
    private var sectionViewModel: CourseSectionViewModelProtocol = CourseSectionViewModel()
    private let configurator: CoursesTableConfiguratorInputProtocol = CoursesTableConfigurator()

    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter.viewDidLoad()
        setupUI()
    }
    
//     MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailVC = segue.destination as! DetailCourseViewController
        let configurator: DetailCourseConfiguratorInputProtocol = DetailCourseConfigurator()
        guard let course = sender as? Course else { return }
        configurator.configure(with: detailVC, and: course)
    }
    
    private func setupUI() {
        title = "SwiftBook Courses"
        tableView.rowHeight = 100
    }
}

// MARK: - CourseTableViewInputProtocol
extension CoursesTableViewController: CourseTableViewInputProtocol {
    func reloadData(for section: CourseSectionViewModel) {
        sectionViewModel = section
        tableView.reloadData()
    }
}

// MARK: - TableViewDataSource
extension CoursesTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sectionViewModel.rows.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellViewModel = sectionViewModel.rows[indexPath.row]
        let cell = tableView.dequeueReusableCell(
            withIdentifier: cellViewModel.cellIdentifier,
            for: indexPath
        ) as! CourseTableViewCell
        cell.viewModel = cellViewModel
        return cell
    }
}

// MARK: - TableViewDelegate
extension CoursesTableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didTapCell(at: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        CGFloat(sectionViewModel.rows[indexPath.row].cellHeight)
    }
}
