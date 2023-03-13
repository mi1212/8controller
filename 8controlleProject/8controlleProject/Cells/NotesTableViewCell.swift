//
//  NotesTableViewCell.swift
//  8controlleProject
//
//  Created by Mikhail Chuparnov on 13.03.2023.
//

import UIKit

final class NotesTableViewCell: UITableViewCell {

    var isGradientBackground = false {
        didSet{
            noteView.isGradientBackground = isGradientBackground
            setupLabelsFontColor()
        }
    }
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        
        stack.axis = .vertical
        return stack
    }()
    
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.4516535997, green: 0.5107401609, blue: 0.8448398709, alpha: 1)
        label.textAlignment = .left
        label.font = .customMediumFont(size: 16)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private let progressLabel: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5)
        label.textAlignment = .left
        label.font = .customRegularFont(size: 14)
        return label
    }()
    
    let noteView = NoteView()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "cellIcon")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.autoresizingMask = .flexibleHeight
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        contentView.addSubview(noteView)
        contentView.addSubview(stackView)
        contentView.addSubview(iconImageView)
        
        stackView.addArrangedSubview(statusLabel)
        stackView.addArrangedSubview(progressLabel)
        
        noteView.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.top.leading.bottom.equalToSuperview().inset(16)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(16)
            make.leading.equalTo(noteView.snp.trailing).offset(16)
        }
        
        iconImageView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(16)
            make.width.height.equalTo(16)
            make.centerY.equalToSuperview()
        }
    }
    
    func setupCellData(progress: Int) {
        progressLabel.text = "\(progress)/10"
        statusLabel.text = "Правильно \(progress+1)0 %"
    }
    
    private func setupLabelsFontColor() {
        if isGradientBackground {
            statusLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5)
            progressLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.2)
        } else {
            statusLabel.textColor = #colorLiteral(red: 0.4516535997, green: 0.5107401609, blue: 0.8448398709, alpha: 1)
            progressLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5)
        }
    }

}
