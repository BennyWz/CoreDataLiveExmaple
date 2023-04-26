//
//  ViewController.swift
//  CoreDataBAZExample
//
//  Created by Benny Reyes on 26/04/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let manager = CoreDataManager()
    var users:[UserEntity] = []{
        didSet{
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        condigTable()
        loadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadData()
    }
    
    func loadData(){
        users = manager.getUsers()
    }
    
    func condigTable(){
        tableView.dataSource = self
        tableView.delegate = self
    }


    @IBAction func addUser(_ sender: Any) {
        let controller = FormViewController(nibName: "FormViewController", bundle: .main, manager: self.manager)
        navigationController?.pushViewController(controller, animated: true)
    }
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "\(users[indexPath.row].name ?? "Sin nombre")"
        return cell
    }
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = FormViewController(nibName: "FormViewController", bundle: .main, manager: self.manager, user: users[indexPath.row])
        navigationController?.pushViewController(controller, animated: true)
    }
}

