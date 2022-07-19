//
//  ViewController.swift
//  APIDemo
//
//  Created by Kushal Rana on 19/07/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var postTableView: UITableView!
    

    var postArray = [Post]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        callAPI()
        postTableView.separatorStyle = .none
        
}

    func callAPI() {
    
        let session = URLSession.shared
            let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
            let task = session.dataTask(with: url, completionHandler: { data, response, error in
             
                
                // Check if an error occured
                if error != nil {
                    print(error?.localizedDescription ?? "")
                    return
                }
                
                // Serialize the data into an object
                do {
                    let json = try JSONDecoder().decode([Post].self, from: data! )
                        //try JSONSerialization.jsonObject(with: data!, options: [])
                    
                    self.postArray = json
                    print(self.postArray.count)
                    
                    DispatchQueue.main.async {
                        self.postTableView.reloadData()
                    }
                } catch {
                    print("Error during JSON serialization: \(error.localizedDescription)")
                }
                
            })
            task.resume()
        }
    
    
   
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as! PostsCell
        
        
        cell.idLabel.text = String(postArray[indexPath.row].id)
        cell.titleLabel.text = postArray[indexPath.row].title
        cell.bodyLabel.text = postArray[indexPath.row].body
        
        return cell
    }
}


