//
//  ViewController.swift
//  MVVM-Unit-Test
//
//  Created by Alex Paul on 1/26/22.
//

import UIKit

class UserViewController: UIViewController{
var network = NetworkService()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        network.getData(urlString: "https://reqres.in/api/users?page=1") { result in
            switch result{
            case .success(let user):
                print(user ?? [])
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        
        }
        // Do any additional setup after loading the view.
    }


}

extension UserViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        return cell
    }
    
    
}

