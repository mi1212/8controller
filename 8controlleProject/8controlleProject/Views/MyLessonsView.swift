//
//  MyLessonsView.swift
//  8controlleProject
//
//  Created by Mikhail Chuparnov on 11.03.2023.
//

import UIKit
import SnapKit

final class MyLessonsView: UIView {
    
    var lessons = [Lesson]() {
        didSet{
            setupLayout()
            lessonsTableView.reloadData()
        }
    }
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Мои уроки"
        label.textColor = UIColor.black
        label.textAlignment = .left
        label.font = UIFont.customMediumFont(size: 20)
        return label
    }()
    
    private let lessonsTableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .white
        table.register(LessonTableViewCell.self, forCellReuseIdentifier: LessonTableViewCell.identifire)
        table.layer.cornerRadius = 8
        return table
    }()
    
    private let configButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setImage(UIImage(named: "config"), for: .normal)
        button.layer.cornerRadius = 12
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 0.9594156146, green: 0.9598115087, blue: 0.9719882607, alpha: 1)
//        setupLayout()
        setupProperts()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setupCornerRadiusToTop()
        print(
            tableView(lessonsTableView, cellForRowAt: IndexPath(row: 0, section: 1)).bounds.height)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        addSubview(titleLabel)
        addSubview(lessonsTableView)
        addSubview(configButton)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(24)
            $0.leading.equalToSuperview().inset(16)
        }
        
        lessonsTableView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(49.9*Double(lessons.count))
        }
        
        configButton.snp.makeConstraints {
            $0.height.width.equalTo(48)
            $0.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(46)
        }
    }
    
    private func setupProperts() {
        lessonsTableView.delegate = self
        lessonsTableView.dataSource = self
    }
    
    private func setupCornerRadiusToTop() {
        let path = UIBezierPath(roundedRect:bounds,
                                byRoundingCorners:[.topRight, .topLeft],
                                cornerRadii: CGSize(width: 20, height:  20))

        let maskLayer = CAShapeLayer()

        maskLayer.path = path.cgPath
        layer.mask = maskLayer
    }
}

extension MyLessonsView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        lessons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LessonTableViewCell.identifire) as! LessonTableViewCell
        cell.setupData(lesson: lessons[indexPath.row])
        print(cell.bounds.height)
        return cell
    }
    
    
}

extension MyLessonsView: UITableViewDelegate {
    
}
