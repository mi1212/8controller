//
//  ViewController.swift
//  8controlleProject
//
//  Created by Mikhail Chuparnov on 10.03.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let lessons = [
        Lesson(name: "Тренируем ноты", isDone: true),
        Lesson(name: "Учим аппликатуру", isDone: true),
        Lesson(name: "Учим темп(длительность нот)", isDone: true),
        Lesson(name: "Учим мелодии", isDone: false),
        
    ]
    
    private let progressView = ProgressView()
    
    private let myLessonsView = MyLessonsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupProperts()
        
    }
    
    private func setupLayout() {
        view.addSubview(progressView)
        view.addSubview(myLessonsView)
        
        progressView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.47)
        }
        
        myLessonsView.snp.makeConstraints { make in
            make.bottom.leading.trailing.equalToSuperview()
            make.top.equalTo(progressView.snp.bottom).inset(30)
        }
    }
    
    private func setupProperts() {
        myLessonsView.lessons = lessons
        
        let lessonsIsDone = lessons.filter { $0.isDone == true }.count
        
        let qtyOfLessons = lessons.count
        
        let progress: Double = Double(lessonsIsDone) / Double(qtyOfLessons)
        
        progressView.progressBar.setProgress(progress: progress, animated: false)
        progressView.progressBar.setupTitleData(lessonsIsDone: lessonsIsDone, qtyOfLessons: qtyOfLessons)
        
    }
    
}

