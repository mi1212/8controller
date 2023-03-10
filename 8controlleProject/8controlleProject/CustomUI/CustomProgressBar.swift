//
//  CustomProgressBar.swift
//  8controlleProject
//
//  Created by Mikhail Chuparnov on 10.03.2023.
//

import UIKit
import SnapKit

final class CustomProgressBar: UIView {
    
    // MARK: - Variables
    
    private var backgroundShapeColor: UIColor = .white
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Пройдено уроков"
        label.textColor = UIColor.white
        label.layer.opacity = 0.6
        label.textAlignment = .center
        label.font = UIFont.customBoldFont(size: 14)
        label.adjustsFontSizeToFitWidth = true
//        label.backgroundColor = .systemGreen
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    

    
    private var progressTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "2/4"
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.font = UIFont.customMediumFont(size: 52)
        label.adjustsFontSizeToFitWidth = true
//        label.backgroundColor = .systemGreen
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var progressShapeColor: UIColor   = .white
    
    var lineWidth: CGFloat = 20
    
    var spaceDegree: CGFloat = 70
    
    var inset: CGFloat = 0
    
    var progress: CGFloat {
        set {
            progressShape?.strokeEnd = newValue
        }
        get {
            return progressShape.strokeEnd
        }
    }
    
    var completeDuration: Double = 5.0
    
    private var backgroundShape: CAShapeLayer!
    private var progressShape: CAShapeLayer!
    
    private var progressAnimation: CABasicAnimation!
    
    // MARK: - Init
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setupTitles()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        
        backgroundShape = CAShapeLayer()
        backgroundShape.fillColor = nil
        backgroundShape.strokeColor = UIColor.white.cgColor
        backgroundShape.opacity = 0.5
        layer.addSublayer(backgroundShape)
        
        progressShape = CAShapeLayer()
        progressShape.fillColor   = nil
        progressShape.strokeStart = 0.0
        progressShape.strokeEnd   = 0.5
        layer.addSublayer(progressShape)
        
        progressAnimation = CABasicAnimation(keyPath: "strokeEnd")
    }
    
    // MARK: - Progress Animation
    
    public func setProgress(progress: CGFloat, animated: Bool = true) {

        if progress > 1.0 && progress < 0.0 {
            return
        }
        
        var start = progressShape.strokeEnd
        if let presentationLayer = progressShape.presentation(){
            if let count = progressShape.animationKeys()?.count, count > 0  {
                start = presentationLayer.strokeEnd
            }
        }
        
        let duration = abs(Double(progress - start)) * completeDuration
        progressShape.strokeEnd = progress
        
        if animated {
            progressAnimation.fromValue = start
            progressAnimation.toValue   = progress
            progressAnimation.duration  = duration
            progressShape.add(progressAnimation, forKey: progressAnimation.keyPath)
        }
    }
    
    // MARK: - Layout
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        backgroundShape.frame = bounds
        progressShape.frame   = bounds
        
        let rect = rectForShape()
        backgroundShape.path = pathForShape(rect: rect).cgPath
        progressShape.path   = pathForShape(rect: rect).cgPath
        
        updateShapes()
        
    }
    
    private func updateShapes() {
        backgroundShape?.lineWidth = lineWidth
        backgroundShape?.strokeColor = backgroundShapeColor.cgColor
        backgroundShape?.lineCap = CAShapeLayerLineCap.round
        
        progressShape?.strokeColor = progressShapeColor.cgColor
        progressShape?.lineWidth = lineWidth - inset
        progressShape?.lineCap = CAShapeLayerLineCap.round
        
        self.progressShape.transform = CATransform3DMakeRotation( CGFloat.pi * 2, 0, 0, 1.0)
        self.backgroundShape.transform = CATransform3DMakeRotation(CGFloat.pi * 2, 0, 0, 1.0)
    }
    
    // MARK: - Helper
    
    private func rectForShape() -> CGRect {
        return bounds.insetBy(dx: lineWidth / 2.0, dy: lineWidth / 2.0)
    }
    
    private func pathForShape(rect: CGRect) -> UIBezierPath {
        let startAngle:CGFloat!
        let endAngle:CGFloat!
        
        startAngle = CGFloat(spaceDegree * .pi / 180.0) + (0.5 * .pi)
        endAngle = CGFloat((360.0 - spaceDegree) * (.pi / 180.0)) + (0.5 * .pi)
        
        let path = UIBezierPath(
            arcCenter: CGPoint(x: rect.midX, y: rect.midY),
            radius: rect.size.width / 2.0,
            startAngle: startAngle,
            endAngle: endAngle,
            clockwise: true
        )
        
        return path
    }
    
    // MARK: - Titles
    
    private func setupTitles() {
        addSubview(titleLabel)
        addSubview(progressTitleLabel)
        
        
        
        progressTitleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(60)
            make.top.equalToSuperview().inset(45)
            make.height.equalTo(60)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(41)
            make.top.equalTo(progressTitleLabel.snp.bottom).offset(5)
        }
    }
    
    func setupTitleData(lessonsIsDone: Int, qtyOfLessons: Int){
        progressTitleLabel.text = "\(lessonsIsDone)/\(qtyOfLessons)"
    }
    

}


