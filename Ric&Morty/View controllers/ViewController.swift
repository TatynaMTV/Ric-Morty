//
//  ViewController.swift
//  Ric&Morty
//
//  Created by Татьяна Мальчик on 16.10.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var tableView = UITableView()
    var cellIdentifire = "cell"
    
    var characters: AllCharacters? // структура с характеристиками персонажей
    let networkService = NetworkService() // класс хранящий метод парсинга JSON
    let urlString = "https://rickandmortyapi.com/api/character"
    
    var selectedRow = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.navigationBar.isTranslucent = false
        navigationController!.navigationBar.barTintColor = .black
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Return to main menu", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem?.tintColor = .white
        
        configerTableView()
        
        //получаем JSON данные

        networkService.request(urlString: urlString) { (result) in
            switch result {
            case .success(let allCharacters):
                self.characters = allCharacters
                self.tableView.reloadData()
            case .failure(let error):
                print("error:", error)
            }
        }
    }
    
    //Функция конфигурации TableView
    func configerTableView() {
        tableView.frame = self.view.frame
        tableView.backgroundColor = UIColor.darkGray
        tableView.separatorColor = UIColor.clear
        tableView.register(CharactersTVCell.self, forCellReuseIdentifier: cellIdentifire)
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifire, for: indexPath) as! CharactersTVCell
        let model = characters?.results[indexPath.row]
        cell.nameCharacters.text = model?.name
        cell.lastLocation.text = model?.lastLocation.name
        cell.firstLocation.text = model?.firstLocation.name
        cell.statusCharacters.text = "\(model?.status ?? "unknown") - \(model?.species ?? "unknown")"
        
        if let imageURL = URL(string: model?.image ?? "nil") {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: imageURL)
                if let data = data {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        cell.characterImageView.image = image
                    }
                }
            }
        }
        
        if model?.status == "Alive" {
            cell.indicatorAlive.backgroundColor = .systemGreen
        } else if model?.status == "Dead" {
            cell.indicatorAlive.backgroundColor = .systemRed
        } else {
            cell.indicatorAlive.backgroundColor = .systemGray4
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 156
    }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRow = indexPath.row
        self.performSegue(withIdentifier: "showDetails", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as? DetailViewController
        vc?.charID = selectedRow + 1
        
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
