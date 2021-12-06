//
//  StatusCharacterCell.swift
//  Ric&Morty
//
//  Created by Татьяна Мальчик on 16.10.2021.
//

import UIKit

class StatusCharacterCell: UITableViewCell {
    
    var titleLable          = UILabel()
    var statusLable         = UILabel()
    var indicatorAlive      = UIView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(statusLable)
        addSubview(indicatorAlive)
        addSubview(titleLable)
        
        createStatusLable()
        createIndicatorAlive()
        createTitleLable()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    func createTitleLable() {
        titleLable.font = .systemFont(ofSize: 20)
        titleLable.textColor = .darkGray
        
        titleLable.translatesAutoresizingMaskIntoConstraints = false
        titleLable.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 15).isActive = true
        titleLable.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: 15).isActive = true
        titleLable.bottomAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        titleLable.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func createStatusLable() {
        statusLable.font = .systemFont(ofSize: 20)
        statusLable.textColor = .white
        
        statusLable.translatesAutoresizingMaskIntoConstraints = false
        statusLable.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 50).isActive = true
        statusLable.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: 15).isActive = true
        statusLable.topAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        statusLable.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func createIndicatorAlive() {
        indicatorAlive.backgroundColor = .systemGreen
        indicatorAlive.layer.cornerRadius = 9
        indicatorAlive.clipsToBounds = true
        
        indicatorAlive.translatesAutoresizingMaskIntoConstraints = false
        indicatorAlive.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 15).isActive = true
        indicatorAlive.heightAnchor.constraint(equalToConstant: 18).isActive = true
        indicatorAlive.widthAnchor.constraint(equalToConstant: 18).isActive = true
        indicatorAlive.centerYAnchor.constraint(equalTo: statusLable.centerYAnchor).isActive = true
    }
}
