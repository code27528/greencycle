//
//  SaveVC.swift
//  recycle
//
//  Created by Sohom Dutta on 7/22/20.
//  Copyright © 2020 Sohom Dutta. All rights reserved.
//

import UIKit
import MessageUI
import Darwin

struct item{
    var contactInfo: String
    var itemDescribe: String
    var imageForItem: UIImage
}

/*struct Contact{
    var contactInfo: String
}
struct Description{
    var itemDescribe: String
}
struct itemImage{
    var imageForItem: UIImage
}*/

class SaveVC: UIViewController, MFMessageComposeViewControllerDelegate, MFMailComposeViewControllerDelegate{
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        sleep(1)
        self.dismiss(animated: true, completion: nil)
    }
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        sleep(1)
        self.dismiss(animated: true, completion: nil)
    }

    

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var fakeImage: UIImageView!
    
    @IBOutlet weak var fakeLabel1: UILabel!
    
    @IBOutlet weak var fakeLabel2: UILabel!
    public var posts: [post] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        posts = createArray()
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewControllerB = segue.destination as? AddPostVC {
            viewControllerB.callback = { message in
                self.fakeLabel1.text = message
            }
            viewControllerB.ballback = {message1 in
                self.fakeImage.image = message1
            }
            viewControllerB.fallback = {message2 in
                self.fakeLabel2.text = message2
            }
            
            /*viewControllerB.fallback = { message in
                //print(message)
                banana = message
            }
            viewControllerB.ballback = {message in
                //print(message)
                orange = message
            }*/
            //tableView.reloadData()
        }
        
    }
    
    func createArray() -> [post]{
        var tempPosts: [post] = []
        let image1 = UIImage(named: "chairImage")
        let image2 = UIImage(named: "fan")
        let image3 = UIImage(named: "oldschoolsupplies")
        let image4 = UIImage(named: "table")
        let image5 = UIImage(named: "usedclothes")
        let image6 = UIImage(named: "usedtextbooks")
        if let post1 = addToArray(imageName: image1, description: "used chair", contactInfo: "okbok0884@gmail.com"){
            tempPosts.append(post1)
        }
        if let post2 = addToArray(imageName: image2, description: "fan", contactInfo: "123@gmail.com"){
            tempPosts.append(post2)
        }
        if let post3 = addToArray(imageName: image3, description: "old school supplies", contactInfo: "1234@gmail.com"){
            tempPosts.append(post3)
        }
        if let post4 = addToArray(imageName: image4, description: "old table", contactInfo: "qwerty@gmail.com"){
            tempPosts.append(post4)
        }
        if let post5 = addToArray(imageName: image5, description: "used clothes", contactInfo: "jkl;@gmail.com"){
            tempPosts.append(post5)
        }
        if let post6 = addToArray(imageName: image6, description: "used textbooks", contactInfo: "hello@gmail.com"){
            tempPosts.append(post6)
        }
        return tempPosts
    }
    func addToArray(imageName: UIImage?, description: String, contactInfo: String) -> post?{
        guard let image1 = imageName else{return nil}
        let post1 = post(image: image1, description: description, contactInfo: contactInfo)
        return post1
    }
    
    @IBAction func backToHome(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func addButtonPressed(_ sender: Any) {
        /*let controller = AddPostVC()
        controller.delegateItem = self*/
        
        performSegue(withIdentifier: "segueOne", sender: self)
    }
    
    @IBAction func postButtonPressed(_ sender: Any) {
        if let image1 = fakeImage.image{
            if let text1 = fakeLabel1.text{
                if let text2 = fakeLabel2.text{
                    if let x = addToArray(imageName: image1, description: text1, contactInfo: text2){
                        posts.insert(x, at: 0)
                        tableView.reloadData()
                    }
                }else{
                    let alert = UIAlertController(title: "You have not supplied enough information", message: "Press + to create a post", preferredStyle: .alert)

                    alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
                    self.present(alert, animated: true)
                }
            }else{
                let alert = UIAlertController(title: "You have not supplied enough information", message: "Press + to create a post", preferredStyle: .alert)

                alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
                self.present(alert, animated: true)
            }
        }else{
            let alert = UIAlertController(title: "You have not supplied enough information", message: "Press + to create a post", preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }
    func showMailComposer(contacter: String, titleInfo: String){
        guard MFMailComposeViewController.canSendMail()else{return}
        let composer = MFMailComposeViewController()
        let composeVC = MFMessageComposeViewController()
        composeVC.messageComposeDelegate = self
        composeVC.recipients = [contacter]
        composeVC.body = "Hi I am interested in the \(titleInfo) you posted"
        composer.mailComposeDelegate = self
        composer.setToRecipients([contacter])
        composer.setSubject(titleInfo)
        if contacter.count == 10{
            present(composeVC, animated: true)
        }else{
            present(composer, animated: true)
        }
        
        
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

extension SaveVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let poster = posts[indexPath.row]
        
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as? PostCell else {return UITableViewCell()}
        cell.configurePost(post: poster,owner: "hello")
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}

extension SaveVC: PostCellDelegate{
    func didTapButton(with owner: String, with description: String) {
        showMailComposer(contacter: owner, titleInfo: description)
    }
    
}

/*extension SaveVC: AddContactDelegate{
    func addItem(contact: Contact, description: Description, image: itemImage) {
        self.dismiss(animated: true){
            self.posts.append(post(image: image.imageForItem, description: description.itemDescribe, contactInfo: contact.contactInfo))
            self.tableView.reloadData()
        }
        
    }
    
}*/

