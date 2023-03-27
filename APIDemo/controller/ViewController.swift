//
//  ViewController.swift
//  APIDemo
//
//  Created by Kushal Rana on 19/07/22.
//

import UIKit
 // 
class ViewController: UIViewController {
    
    @IBOutlet weak var postTableView: UITableView!
    
    var postModelArray = [PostModel]() // struct type model
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        postTableView.separatorStyle = .none
        
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        
        URLSession.shared.fetchData(for: url) { (result: Result<[PostModel], Error>) in
            switch result {
            case .success(let jsonObject):
                print(jsonObject)
                self.postModelArray = jsonObject
                DispatchQueue.main.async {
                    self.postTableView.reloadData()
                }
                break
            case .failure(let error):
                // A failure, please handle
                print(error)
                break
          }
        }
}
   
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postModelArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as! PostsCell
        

        cell.idLabel.text = String(postModelArray[indexPath.row].id)
        cell.titleLabel.text = postModelArray[indexPath.row].title
        cell.bodyLabel.text = postModelArray[indexPath.row].body
        
        return cell
    }
}




// https://jsonplaceholder.typicode.com/posts // "https://jsonplaceholder.typicode.com/todos"
// mvvm
// model view viewmodel
