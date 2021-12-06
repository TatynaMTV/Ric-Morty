//
//  DetailTableViewCell.swift
//  Ric&Morty
//
//  Created by Татьяна Мальчик on 16.10.2021.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    
    var titleLable          = UILabel()
    var propertiesLable     = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(propertiesLable)
        addSubview(titleLable)
        
        createPropertiesLable()
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
    
    func createPropertiesLable() {
        propertiesLable.text = "SOME TEXT"
        propertiesLable.font = .systemFont(ofSize: 20)
        propertiesLable.textColor = .white
        
        propertiesLable.translatesAutoresizingMaskIntoConstraints = false
        propertiesLable.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 15).isActive = true
        propertiesLable.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: 15).isActive = true
        propertiesLable.topAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        propertiesLable.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
}
