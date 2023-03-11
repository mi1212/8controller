//
//  LessonTableViewCell.swift
//  8controlleProject
//
//  Created by Mikhail Chuparnov on 11.03.2023.
//

import UIKit
import SnapKit

class LessonTableViewCell: UITableViewCell {

    private let lessonTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Мои уроки"
        label.textColor = UIColor.black
        label.textAlignment = .left
        label.font = .customRegularFont(size: 16)
//        label.backgroundColor = .systemGreen
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private let statusIsDoneLabel: UILabel = {
        let label = UILabel()
        label.text = "Пройдено"
        label.textColor = #colorLiteral(red: 0.4699814916, green: 0.8021609187, blue: 0.2993537784, alpha: 1)
        label.textAlignment = .right
        label.font = .customRegularFont(size: 14)
        return label
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "cellIcon")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        contentView.addSubview(lessonTitleLabel)
        contentView.addSubview(iconImageView)
        
        lessonTitleLabel.snp.makeConstraints { make in
            make.top.leading.bottom.equalToSuperview().inset(16)
        }
        
        iconImageView.snp.makeConstraints { make in
            make.top.bottom.trailing.equalToSuperview().inset(16)
            make.width.equalTo(iconImageView.snp.height)
        }
//
//        contentView.snp.makeConstraints { make in
//            make.height.equalTo(52)
////            make.edges.equalToSuperview()
//        }
        
    }
    
    private func setupStatusIsDoneLabel() {
        contentView.addSubview(statusIsDoneLabel)
        
        statusIsDoneLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalTo(iconImageView.snp.leading).inset(-16)
        }
        
        lessonTitleLabel.snp.makeConstraints { make in
            make.trailing.equalTo(statusIsDoneLabel.snp.leading).inset(-16)
        }
        
    }
    
    func setupData(lesson: Lesson) {
        lessonTitleLabel.text = lesson.name
        
        if lesson.isDone {
            setupStatusIsDoneLabel()
        }
        
    }

}
