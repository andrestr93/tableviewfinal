//
//  ViewController.swift
//  TablaGuitarrasDI
//
//  Created by andres on 24/02/2020.
//  Copyright © 2020 andres. All rights reserved.
//

import UIKit
import Foundation
import Firebase
import FirebaseDatabase
import AVKit
class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return table.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let guitarra: Guitarra
        
        guitarra = table[indexPath.row]
      cell.textLabel?.text = guitarra.Title
        
        return cell
    }
    var table = [Guitarra]()
    var ref: DatabaseReference!
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference().child("Guitarras")
        ref.observe(DataEventType.value, with: {(snapshot) in
            if snapshot.childrenCount > 0 {
                self.table.removeAll()
                
                for video in snapshot.children.allObjects as! [DataSnapshot] {
                    
                    let Object = video.value as? [String: AnyObject]
                    let Title = Object?["Title"]
                    let videolink = Object?["link"]
                    
                    
                    let guitarra = Guitarra(Title: Title as! String, link: videolink as! String)
                    self.table.append(guitarra)
                    
                    //self.Tableview.reloadData()
                    
                }
            }
            
        })
        
          
          
          func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
              guard let videoURL = URL(string: table[indexPath.row].link!) else {
                  return
              }
              
              let player = AVPlayer(url: videoURL)
              
              let controller = AVPlayerViewController()
              controller.player = player
              
              present(controller, animated: true) {
                  player.play()
              }
          }
          
          
          
          
    }


}

