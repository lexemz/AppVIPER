//
//  CoursesTableViewController.swift
//  AppMVVM
//
//  Created by Igor on 22.02.2022.
//

import UIKit

class CoursesTableViewController: UITableViewController {
    
    private var courses: [Course] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailVC = segue.destination as! DetailCourseViewController
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        
        detailVC.course = courses[indexPath.row]
    }
    
    private func setupUI() {
        title = "SwiftBook Courses"
        tableView.rowHeight = 100
        
        fetchCourses()
    }
    
    private func fetchCourses() {
        NetworkManager.shared.fetchCourses { [unowned self] result in
            switch result {
                
            case .success(let courses):
                self.courses = courses
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(_):
                print("SOMETHING GOT WRONG")
            }
        }
    }

}

// MARK: - Table view data source

extension CoursesTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        courses.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CourseCell") as! CourseTableViewCell
        let course = courses[indexPath.row]
        
        cell.configure(with: course)
        
        return cell
    }
}
