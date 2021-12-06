//
//  CharactersTableViewCell.swift
//  Ric&Morty
//
//  Created by Татьяна Мальчик on 16.10.2021.
//


import UIKit

class CharactersTVCell: UITableViewCell {

    var backView            = UIView()
    var characterImageView  = UIImageView() //JSON
    var nameCharacters      = UILabel() //JSON
    var statusCharacters    = UILabel() // JSON status + species
    var lastKnownLocation   = UILabel() // "Last known Location:"
    var lastLocation        = UILabel() //JSON
    var firstSeenIn         = UILabel() //"First seen in:"
    var firstLocation       = UILabel() //JSON
    var indicatorAlive      = UIView()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(backView)
        self.backgroundColor = UIColor.black
        
        settingsBackView()
        settingsCharactersImageView()
        settingsNameCharacters()
        settingStatusCharacters()
        settingsIndicatorAlive()
        settingLastKnownLocation()
        settingLastLocation()
        settingFirstSeenIn()
        settingFirstLocation()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func settingsBackView() {
        backView.backgroundColor = .darkGray
        backView.layer.cornerRadius = 10
        backView.clipsToBounds = true
        backView.layer.masksToBounds = true
        
        backView.translatesAutoresizingMaskIntoConstraints = false
        backView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        backView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        backView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        backView.topAnchor.constraint(equalTo: self.topAnchor, constant: 4).isActive = true
        
        backView.addSubview(characterImageView)
        backView.addSubview(nameCharacters)
        backView.addSubview(statusCharacters)
        backView.addSubview(indicatorAlive)
        backView.addSubview(lastKnownLocation)
        backView.addSubview(lastLocation)
        backView.addSubview(firstSeenIn)
        backView.addSubview(firstLocation)
    }
    
    func settingsCharactersImageView() {
        characterImageView.clipsToBounds = true
        characterImageView.contentMode = .scaleAspectFill
        
        characterImageView.translatesAutoresizingMaskIntoConstraints = false
        characterImageView.leftAnchor.constraint(equalTo: backView.leftAnchor).isActive = true
        characterImageView.topAnchor.constraint(equalTo: backView.topAnchor).isActive = true
        characterImageView.bottomAnchor.constraint(equalTo: backView.bottomAnchor).isActive = true
        characterImageView.widthAnchor.constraint(equalTo: backView.widthAnchor, multiplier: 1/3).isActive = true
    }
    
    func settingsNameCharacters() {
        nameCharacters.font = .systemFont(ofSize: 25)
        nameCharacters.adjustsFontSizeToFitWidth = true
        nameCharacters.textColor = .white
        
        nameCharacters.translatesAutoresizingMaskIntoConstraints = false
        nameCharacters.leftAnchor.constraint(equalTo: characterImageView.rightAnchor, constant: 10).isActive = true
        nameCharacters.topAnchor.constraint(equalTo: backView.topAnchor, constant: 5).isActive = true
        nameCharacters.rightAnchor.constraint(equalTo: backView.rightAnchor, constant: -10).isActive = true
        nameCharacters.heightAnchor.constraint(equalTo: backView.heightAnchor, multiplier: 1/6).isActive = true
    }
    
    func settingStatusCharacters() {
        statusCharacters.font = .systemFont(ofSize: 12)
        statusCharacters.textColor = .white
        
        statusCharacters.translatesAutoresizingMaskIntoConstraints = false
        statusCharacters.leftAnchor.constraint(equalTo: indicatorAlive.rightAnchor, constant: 10).isActive = true
        statusCharacters.topAnchor.constraint(equalTo: nameCharacters.bottomAnchor).isActive = true
        statusCharacters.rightAnchor.constraint(equalTo: backView.rightAnchor, constant: -10).isActive = true
        statusCharacters.heightAnchor.constraint(equalTo: backView.heightAnchor, multiplier: 1/6).isActive = true
    }
    
    func settingsIndicatorAlive() {
        indicatorAlive.backgroundColor = .systemGreen
        indicatorAlive.layer.cornerRadius = 6
        indicatorAlive.clipsToBounds = true
        
        indicatorAlive.translatesAutoresizingMaskIntoConstraints = false
        indicatorAlive.leftAnchor.constraint(equalTo: characterImageView.rightAnchor, constant: 10).isActive = true
        indicatorAlive.centerYAnchor.constraint(equalTo: statusCharacters.centerYAnchor).isActive = true
        indicatorAlive.heightAnchor.constraint(equalToConstant: 12).isActive = true
        indicatorAlive.widthAnchor.constraint(equalToConstant: 12).isActive = true
    }
    
    func settingLastKnownLocation() {
        lastKnownLocation.text = "Last known Location:"
        lastKnownLocation.font = .systemFont(ofSize: 15)
        lastKnownLocation.textColor = .systemGray4
        
        lastKnownLocation.translatesAutoresizingMaskIntoConstraints = false
        lastKnownLocation.leftAnchor.constraint(equalTo: characterImageView.rightAnchor, constant: 10).isActive = true
        lastKnownLocation.topAnchor.constraint(equalTo: statusCharacters.bottomAnchor, constant: 3).isActive = true
        lastKnownLocation.rightAnchor.constraint(equalTo: backView.rightAnchor, constant: -10).isActive = true
        lastKnownLocation.heightAnchor.constraint(equalTo: backView.heightAnchor, multiplier: 1/7).isActive = true
    }
    
    func settingLastLocation() {
        lastLocation.font = .systemFont(ofSize: 15)
        lastLocation.textColor = .white
        
        lastLocation.translatesAutoresizingMaskIntoConstraints = false
        lastLocation.leftAnchor.constraint(equalTo: characterImageView.rightAnchor, constant: 10).isActive = true
        lastLocation.topAnchor.constraint(equalTo: lastKnownLocation.bottomAnchor).isActive = true
        lastLocation.rightAnchor.constraint(equalTo: backView.rightAnchor, constant: -10).isActive = true
        lastLocation.heightAnchor.constraint(equalTo: backView.heightAnchor, multiplier: 1/7).isActive = true
    }
    
    func settingFirstSeenIn() {
        firstSeenIn.text = "First seen in:"
        firstSeenIn.font = .systemFont(ofSize: 15)
        firstSeenIn.textColor = .systemGray4
        
        firstSeenIn.translatesAutoresizingMaskIntoConstraints = false
        firstSeenIn.leftAnchor.constraint(equalTo: characterImageView.rightAnchor, constant: 10).isActive = true
        firstSeenIn.topAnchor.constraint(equalTo: lastLocation.bottomAnchor, constant: 3).isActive = true
        firstSeenIn.rightAnchor.constraint(equalTo: backView.rightAnchor, constant: -10).isActive = true
        firstSeenIn.heightAnchor.constraint(equalTo: backView.heightAnchor, multiplier: 1/7).isActive = true
    }
    
    func settingFirstLocation() {
        firstLocation.font = .systemFont(ofSize: 15)
        firstLocation.textColor = .white
        
        firstLocation.translatesAutoresizingMaskIntoConstraints = false
        firstLocation.leftAnchor.constraint(equalTo: characterImageView.rightAnchor, constant: 10).isActive = true
        firstLocation.topAnchor.constraint(equalTo: firstSeenIn.bottomAnchor).isActive = true
        firstLocation.rightAnchor.constraint(equalTo: backView.rightAnchor, constant: -10).isActive = true
        firstLocation.heightAnchor.constraint(equalTo: backView.heightAnchor, multiplier: 1/7).isActive = true
    }
}

