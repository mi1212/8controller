//
//  NoteView.swift
//  8controlleProject
//
//  Created by Mikhail Chuparnov on 13.03.2023.
//

import UIKit

final class NoteView: UIView {

    var isGradientBackground = false
    
    private let gradient = CAGradientLayer()
    
    private let noteLabel: UILabel = {
        let label = UILabel()
        label.text = "До"
        label.textAlignment = .left
        label.font = .customBoldFont(size: 20)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        setupProperts()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setupBackground()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        addSubview(noteLabel)
        
        noteLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    private func setupProperts() {
        layer.borderColor = #colorLiteral(red: 0.3764705882, green: 0.4196078431, blue: 0.8078431373, alpha: 0.43)
        layer.borderWidth = 1
        clipsToBounds = true
        layer.cornerRadius = 10
    }
    
    private func setupBackground() {
        if isGradientBackground {
            backgroundColor = .white
            noteLabel.textColor = #colorLiteral(red: 0.4516535997, green: 0.5107401609, blue: 0.8448398709, alpha: 1)
        } else {
            setupGradientColor()
            noteLabel.textColor = .white
        }
    }
    
    private func setupGradientColor() {
        gradient.frame = bounds
        gradient.colors = [UIColor.colorGradientStart.cgColor, UIColor.colorGradientEnd.cgColor]
        layer.insertSublayer(gradient, at: 0)
    }

}
