//
//  FormViewController.swift
//  CoreDataBAZExample
//
//  Created by Benny Reyes on 26/04/23.
//

import UIKit

class FormViewController: UIViewController {

    @IBOutlet weak var txtFieldName: UITextField!
    @IBOutlet weak var txtFieldPhone: UITextField!
    var manager:CoreDataManager
    var user:UserEntity?
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?, manager:CoreDataManager, user:UserEntity? = nil) {
        self.manager = manager
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.user = user
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        txtFieldName.text = user?.name
        txtFieldPhone.text = user?.phone
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   // MARK: Actions
    @IBAction func saveData(_ sender: Any) {
        guard let name = txtFieldName.text,
              let phone = txtFieldPhone.text,
              !name.isEmpty, !phone.isEmpty
        else { return }
        
        if user != nil {
            user?.name = name
            user?.phone = phone
            manager.updateUser(user!)
        }else{
            manager.createUser(name: name, phone: phone)
        }
    }
    
    
    @IBAction func deleteData(_ sender: Any) {
        guard let deleteUser = user else { return }
        manager.deleteUser(deleteUser)
    }
}
