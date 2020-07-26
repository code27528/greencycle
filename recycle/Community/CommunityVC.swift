//
//  CommunityVC.swift
//  recycle
//
//  Created by Sohom Dutta on 7/21/20.
//  Copyright © 2020 Sohom Dutta. All rights reserved.
//

import UIKit
import CoreData

class CommunityVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var items: [item] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        items = createArray()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
    }
    
    func createArray() -> [item]{
        var tempArray: [item] = []
        if let image1 = UIImage(named: "chairImage"){
            let item1 = item(image: image1, title: "Used Chair", contact: "hello@gmail.com")
            tempArray.append(item1)
        }
        
        return tempArray
    }
    
    @IBAction func addItem(_ sender: Any) {
        
        
    }
    
    @IBAction func goToMainVC(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension CommunityVC: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "hello") as! itemcell
        cell.setItem(item: item)
        
        return cell
        
    }
    
}
