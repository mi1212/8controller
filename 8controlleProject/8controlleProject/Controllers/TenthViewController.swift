//
//  TenthViewController.swift
//  8controlleProject
//
//  Created by Mikhail Chuparnov on 13.03.2023.
//

import UIKit
import SnapKit

final class TenthViewController: UIViewController {

    private let notesTabelView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(NotesTableViewCell.self, forCellReuseIdentifier: NotesTableViewCell.identifire)
        tableView.layer.cornerRadius = 8
//        tableView.backgroundColor = .tintColor
//        tableView.isScrollEnabled = false
        return tableView
    }()
    
    private let configButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setImage(UIImage(named: "config"), for: .normal)
        button.layer.cornerRadius = 12
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupProperts()
    }
    
    private func setupLayout() {
        view.addSubview(notesTabelView)
        view.addSubview(configButton)
        
        notesTabelView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.height.equalTo(81*7)
        }
        
        configButton.snp.makeConstraints {
            $0.height.width.equalTo(48)
            $0.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(46)
        }

    }
    
    private func setupProperts() {
        notesTabelView.delegate = self
        notesTabelView.dataSource = self
        
        view.backgroundColor = #colorLiteral(red: 0.9594156146, green: 0.9598115087, blue: 0.9719882607, alpha: 1)
    }

}

extension TenthViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NotesTableViewCell.identifire, for: indexPath) as! NotesTableViewCell
        cell.setupCellData(progress: indexPath.row)
        if indexPath.row%2 == 0 {
            cell.isGradientBackground = true
        } else {
            cell.isGradientBackground = false
        }
        
        return cell
    }
}

extension TenthViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        81
    }
    
}
