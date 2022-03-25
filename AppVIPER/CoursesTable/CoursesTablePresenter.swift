//
//  CoursesTablePresenter.swift
//  AppVIPER
//
//  Created by Igor on 12.03.2022.
//

import Foundation

struct CoursesTableDataStore {
    let courses: [Course]
}

class CoursesTablePresenter: CourseTableViewOutputProtocol {
    unowned let view: CourseTableViewInputProtocol
    var interactor: CourseTableInteractorInputProtocol!
    var router:  CourseTableRouterInputProtocol!
    
    private var dataStore: CoursesTableDataStore?
    
    required init(view: CourseTableViewInputProtocol) {
        self.view = view
    }
    
    func viewDidLoad() {
        interactor.fetchCourses()
    }
    
    // Методы вызвается при нажатии на ячейку, сообщает роутеру, что нужно сделать переход
    func didTapCell(at indexPath: IndexPath) {
        guard let course = dataStore?.courses[indexPath.row] else { return }
        router.openDetailCourseViewController(with: course)
    }
}

extension CoursesTablePresenter: CourseTableInteractorOutputProtocol {
    func coursesDidRecive(with dataStore: CoursesTableDataStore) {
        // Иницилизируем свойство, чтобы был локальный список курсов в Presenter
        self.dataStore = dataStore
        
        // Создание секции для таблицы
        let section = CourseSectionViewModel()
        
        // Наполнение секции строками со своими вью моделями
        dataStore.courses.forEach { course in
            let courseCellViewModel = CourseCellViewModel(course: course)
            section.rows.append(courseCellViewModel)
        }
        
        view.reloadData(for: section)
    }
}
