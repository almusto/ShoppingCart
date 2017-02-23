//
//  ShoppingCartVC.swift
//  ShoppingCart
//
//  Created by Alessandro Musto on 2/21/17.
//  Copyright © 2017 Lmusto. All rights reserved.
//

import UIKit

class ShoppingCartVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

  @IBOutlet weak var tableView: UITableView!

  var shoppingCart: [String] = []
  
    override func viewDidLoad() {
        super.viewDidLoad()
      tableView.delegate = self
      tableView.dataSource = self

    }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return shoppingCart.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomTableViewCell
    cell.textLabel?.text = shoppingCart[indexPath.row]
    cell.cellIndex = indexPath
    cell.tableView = tableView
    return cell
  }

  func tableView(_ tableView: UITableView, performAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) {
    shoppingCart.remove(at: indexPath.row)
    tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.fade)
    tableView.reloadData()

  }





}
