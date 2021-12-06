//
//  DetailViewController.swift
//  Ric&Morty
//
//  Created by Татьяна Мальчик on 16.10.2021.
//


import UIKit

class DetailViewController: UIViewController {
    
    var detailTableView = UITableView()
    let detailCellIdentifire = "detailCell"
    let statusCellIdentifire = "statusCell"
    
    //Header для detailTableView
    var headerView = UIView()
    var headerImageView = UIImageView()
    var nameLabel = UILabel()
    
    var char: OneCharacter?
    var charID: Int = 2
    var charStatus = ""
    var titleForCell:[TitleForCell] = []
    
    
    let detailNetworkService = DetailNetworkService() // класс хранящий метод парсинга JSON

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createDetailTableView()
    
        char?.id = charID

        //получаем JSON данные
        let urlString = "https://rickandmortyapi.com/api/character/\(charID)"
        detailNetworkService.request(urlString: urlString) { (result) in
            switch result {
            case .success(let oneCharacters):
                self.char = oneCharacters
                createData()
                self.createHeaderView()
                if let imageURL = URL(string: self.char?.image ?? "nil") {
                    DispatchQueue.global().async {
                        let data = try? Data(contentsOf: imageURL)
                        if let data = data {
                            let image = UIImage(data: data)
                            DispatchQueue.main.async {
                                self.headerImageView.image = image
                                self.detailTableView.reloadData()
                            }
                        }
                    }
                }
                
            case .failure(let error):
                print("error:", error)
            }
        }
        
        func createData() {
            titleForCell = [
                TitleForCell(titleForCell: "Live status:", propertiesForCell: char?.status ?? "nil"),
                TitleForCell(titleForCell: "Species and gender:", propertiesForCell: "\(char?.species ?? "nil")(\(char?.gender ?? "nil"))"),
                TitleForCell(titleForCell: "Last known location:", propertiesForCell: char?.origin.name ?? "nil"),
                TitleForCell(titleForCell: "First seen in:", propertiesForCell: char?.location.name ?? "nil")
            ]
        }
    }
    
    func createDetailTableView() {
        detailTableView.frame = self.view.frame
        detailTableView.backgroundColor = UIColor.black
        detailTableView.separatorColor = UIColor.clear
        detailTableView.register(StatusCharacterCell.self, forCellReuseIdentifier: statusCellIdentifire)
        detailTableView.register(DetailTableViewCell.self, forCellReuseIdentifier: detailCellIdentifire)
        detailTableView.delegate = self
        detailTableView.dataSource = self
        view.addSubview(detailTableView)
    }

    func createHeaderView() {
        headerView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: 353)
        headerView.backgroundColor = .gray
        
        headerImageView.clipsToBounds = true
        headerImageView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: 300)
        headerImageView.contentMode = .scaleAspectFill
        
        nameLabel.text = char?.name
        nameLabel.frame = CGRect(x: 0, y: 300, width: view.frame.size.width, height: 50)
        nameLabel.backgroundColor = .black
        nameLabel.textAlignment = .center
        nameLabel.font = .systemFont(ofSize: 25, weight: .bold)
        nameLabel.textColor = .white
        
        headerView.addSubview(headerImageView)
        headerView.addSubview(nameLabel)
        detailTableView.tableHeaderView = headerView
    }
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    

    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = view as? UITableViewHeaderFooterView

        header?.textLabel?.textColor = .systemGray
        header?.textLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleForCell.count
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: statusCellIdentifire, for: indexPath) as! StatusCharacterCell
            cell.titleLable.text = "Live status:"
            cell.statusLable.text = char?.status

            if char?.status == "Alive" {
                cell.indicatorAlive.backgroundColor = .systemGreen
            } else if char?.status == "Dead" {
                cell.indicatorAlive.backgroundColor = .systemRed
            } else {
                cell.indicatorAlive.backgroundColor = .systemGray4
            }
            
            cell.backgroundColor = .black
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: detailCellIdentifire, for: indexPath) as! DetailTableViewCell
            cell.titleLable.text = titleForCell[indexPath.row].titleForCell
            cell.propertiesLable.text = titleForCell[indexPath.row].propertiesForCell
            cell.propertiesLable.textColor = .white
            cell.backgroundColor = .black
            
            return cell
        }

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
}
