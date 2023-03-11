//
//  ProgressView.swift
//  8controlleProject
//
//  Created by Mikhail Chuparnov on 11.03.2023.
//

import UIKit

final class ProgressView: UIView {

    var progressBar = CustomProgressBar()
        
    private let gradient = CAGradientLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupGradientColor()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        addSubview(progressBar)
        
        progressBar.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(140)
            $0.width.height.equalTo(200)
        }
    }
    
    private func setupGradientColor() {
        gradient.frame = bounds
        gradient.colors = [UIColor.colorGradientStart.cgColor, UIColor.colorGradientEnd.cgColor]
        layer.insertSublayer(gradient, at: 0)
    }

}
