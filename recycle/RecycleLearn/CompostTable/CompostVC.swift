//
//  CompostVC.swift
//  recycle
//
//  Created by Sohom Dutta on 7/23/20.
//  Copyright © 2020 Sohom Dutta. All rights reserved.
//

import UIKit

class CompostVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    public var compostItems: [CompostItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        compostItems = createArray()

        // Do any additional setup after loading the view.
    }
    func createArray() -> [CompostItem]{
        var tempPosts: [CompostItem] = []
        let image1 = UIImage(named: "compostnature")
        let image2 = UIImage(named: "foodscraps")
        let image3 = UIImage(named: "drypetfood")
        let image4 = UIImage(named: "vacuum")
        let image5 = UIImage(named: "dryer")
        let image6 = UIImage(named: "herbsspices")
        if let post1 = addToArray(imageName: image1, description: "leaves, grass clippings, etc."){
            tempPosts.append(post1)
        }
        if let post2 = addToArray(imageName: image2, description: "food scraps"){
            tempPosts.append(post2)
        }
        if let post3 = addToArray(imageName: image3, description: "dry pet food"){
            tempPosts.append(post3)
        }
        if let post4 = addToArray(imageName: image4, description: "vacuum dust"){
            tempPosts.append(post4)
        }
        if let post5 = addToArray(imageName: image5, description: "dryer lint"){
            tempPosts.append(post5)
        }
        if let post6 = addToArray(imageName: image6, description: "herbs and spices"){
            tempPosts.append(post6)
        }
        return tempPosts
    }
    func addToArray(imageName: UIImage?, description: String) -> CompostItem?{
        guard let image1 = imageName else{return nil}
        let post1 = CompostItem(image: image1, description: description)
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

extension CompostVC: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return compostItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = compostItems[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "composter", for: indexPath) as? CompostCell else {return UITableViewCell()}
        cell.configureCompost(compostItem: item)
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
}
