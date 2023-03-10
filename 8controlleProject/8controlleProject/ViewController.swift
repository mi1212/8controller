//
//  ViewController.swift
//  8controlleProject
//
//  Created by Mikhail Chuparnov on 10.03.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private lazy var progressBar = CustomProgressBar()
    
    private let plusButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("+", for: .normal)
        return button
    }()
    
    private let minusButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("-", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray
        setupLayout()
    }
    
    private func setupLayout() {
        view.addSubview(progressBar)
        view.addSubview(plusButton)
        view.addSubview(minusButton)
        
        plusButton.addTarget(self, action: #selector(tapPlusButton), for: .touchUpInside)
        
        minusButton.addTarget(self, action: #selector(tapMinusButton), for: .touchUpInside)
        
        progressBar.snp.makeConstraints {
            $0.centerX.centerY.equalTo(view.safeAreaLayoutGuide)
            $0.width.equalToSuperview().multipliedBy(0.6)
            
            $0.height.equalTo(progressBar.snp.width)
        }
        
        plusButton.snp.makeConstraints { make in
            make.trailing.equalTo(progressBar)
            make.top.equalTo(progressBar.snp.bottom)
            make.width.equalTo(progressBar).multipliedBy(0.5)
            make.height.equalTo(50)
        }
        
        minusButton.snp.makeConstraints { make in
            make.leading.equalTo(progressBar)
            make.top.equalTo(progressBar.snp.bottom)
            make.width.equalTo(progressBar).multipliedBy(0.5)
            make.height.equalTo(50)
        }
    }
    
    @objc private func tapPlusButton() {
        let progress = self.progressBar.progress
        if progress != 1 {
            self.progressBar.setProgress(progress: progress+0.1)
        }
    }
    
    @objc private func tapMinusButton() {
        let progress = self.progressBar.progress
        if progress != 0 {
            self.progressBar.setProgress(progress: progress-0.1)
        }
    }
    
}

