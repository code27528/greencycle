//
//  RecycleVC.swift
//  recycle
//
//  Created by Sohom Dutta on 7/23/20.
//  Copyright © 2020 Sohom Dutta. All rights reserved.
//

import UIKit

class RecycleVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    public var recycleItems: [RecycleItem] = []
    
    override func viewDidLoad() {
        
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        recycleItems = createArray()
    }
    
    func createArray() -> [RecycleItem]{
        var tempPosts: [RecycleItem] = []
        let image1 = UIImage(named: "canstins")
        let image2 = UIImage(named: "cartons")
        let image3 = UIImage(named: "newspapers")
        let image4 = UIImage(named: "plasticbottles")
        let image5 = UIImage(named: "cardboard")
        let image6 = UIImage(named: "plasticpackaging")
        if let post1 = addToArray(imageName: image1, description: "cans and tins"){
            tempPosts.append(post1)
        }
        if let post2 = addToArray(imageName: image2, description: "cartons"){
            tempPosts.append(post2)
        }
        if let post3 = addToArray(imageName: image3, description: "newspapers, envelopes, etc."){
            tempPosts.append(post3)
        }
        if let post4 = addToArray(imageName: image4, description: "plastic bottles"){
            tempPosts.append(post4)
        }
        if let post5 = addToArray(imageName: image5, description: "cardboard"){
            tempPosts.append(post5)
        }
        if let post6 = addToArray(imageName: image6, description: "plastic packaging"){
            tempPosts.append(post6)
        }
        return tempPosts
    }
    func addToArray(imageName: UIImage?, description: String) -> RecycleItem?{
        guard let image1 = imageName else{return nil}
        let post1 = RecycleItem(image: image1, description: description)
        return post1
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
extension RecycleVC: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recycleItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = recycleItems[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "recycler", for: indexPath) as? RecycleCell else {return UITableViewCell()}
        cell.configureRecycle(recycleItem: item)
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
}



