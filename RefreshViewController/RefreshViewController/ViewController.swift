//
//  ViewController.swift
//  RefreshViewController
//
//  Created by ShrawanKumar Sharma on 06/01/17.
//  Copyright © 2017 com.RefreshViewController. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource, UITableViewDelegate {

    var dataArray: Array<String> = ["One", "Two", "Three", "Four", "Five"]
    
    @IBOutlet weak var tblView: UITableView!
    
    var customView:UIView!
    
    var refreshControl: UIRefreshControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        addRefreshControl()
        loadViewFromXib()
    }
    
    func addRefreshControl() {
        refreshControl = UIRefreshControl(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 300) )
        
        refreshControl.backgroundColor = .red
        refreshControl.tintColor = .blue
    }
    
    
    func loadViewFromXib() {
        
        let refreshContents = Bundle.main.loadNibNamed("RefreshView", owner: self, options: nil)
        let extractView = refreshContents?.first as! UIView
        customView = UIView(frame: self.refreshControl.bounds)
        customView = extractView
        refreshControl.addSubview(customView)
        tblView.insertSubview(refreshControl, at: 0)

        
        
    }
    
    func configureTableView(){
        tblView.register(UITableViewCell.self, forCellReuseIdentifier: "RefreshCell")
        tblView.delegate = self
        tblView.dataSource = self
    }
  
   
    
    //MARK:- Table view data source and delegate
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblView.dequeueReusableCell(withIdentifier: "RefreshCell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = "Text Vuiew"
         return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    
}

