//
//  TrashVC.swift
//  recycle
//
//  Created by Sohom Dutta on 7/23/20.
//  Copyright © 2020 Sohom Dutta. All rights reserved.
//

import UIKit

class TrashVC: UIViewController {


    @IBOutlet weak var tableView: UITableView!
    
    public var trashItems: [TrashItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        trashItems = createArray()

        // Do any additional setup after loading the view.
    }
    func createArray() -> [TrashItem]{
        var tempPosts: [TrashItem] = []
        let image1 = UIImage(named: "paintcans")
        let image2 = UIImage(named: "medical waste")
        let image3 = UIImage(named: "rocks")
        let image4 = UIImage(named: "electricalgoods")
        let image5 = UIImage(named: "hazardouswaste")
        let image6 = UIImage(named: "usedtextbooks")
        if let post1 = addToArray(imageName: image1, description: "paint cans"){
            tempPosts.append(post1)
        }
        if let post2 = addToArray(imageName: image2, description: "medical waste"){
            tempPosts.append(post2)
        }
        if let post3 = addToArray(imageName: image3, description: "rocks, bricks, gravel"){
            tempPosts.append(post3)
        }
        if let post4 = addToArray(imageName: image4, description: "electrical goods"){
            tempPosts.append(post4)
        }
        if let post5 = addToArray(imageName: image5, description: "hazardouswaste"){
            tempPosts.append(post5)
        }
        return tempPosts
    }
    func addToArray(imageName: UIImage?, description: String) -> TrashItem?{
        guard let image1 = imageName else{return nil}
        let post1 = TrashItem(image: image1, description: description)
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

extension TrashVC: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trashItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = trashItems[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "trasher", for: indexPath) as? TrashCell else {return UITableViewCell()}
        cell.configureTrash(trashItem: item)
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
}
