//
//  ViewController.swift
//  Custom_Pull_To_Refresh
//
//  Created by ShrawanKumar Sharma on 09/01/17.
//  Copyright © 2017 com.Custom_Pull_To_Refresh. All rights reserved.
//


import UIKit

class ViewController: UIViewController , UITableViewDataSource, UITableViewDelegate,PassDataDelegateData {
    
    var dataArray: Array<String> = ["One", "Two", "Three", "Four", "Five"]
    @IBOutlet weak var tblView: UITableView!
    
    var customView:UIView!
    
    
    var customRefreshView:CustomRefreshView!
    
    
    var refreshControl: UIRefreshControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        //addRefreshControl()
        //loadViewFromXib()
        
        addCustomControlRefreshView()
        
        
        setTargetAndAction()
        customRefreshView.delegate = self
        
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
        customView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 100)
        refreshControl.addSubview(customView)
        refreshControl.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 100)
        tblView.insertSubview(refreshControl, at: 0)
    }
    
    func configureTableView() {
        tblView.register(UITableViewCell.self, forCellReuseIdentifier: "RefreshCell")
        tblView.delegate = self
        tblView.dataSource = self
    }
    
    
    
    //MARK:- Table view data source and delegate
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblView.dequeueReusableCell(withIdentifier: "RefreshCell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = "Text View"
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    
    func addCustomControlRefreshView() {
        customRefreshView = CustomRefreshView(frame: CGRect(x: 0, y: -100, width: self.view.frame.size.width, height: 100))
//        customRefreshView.backgroundColor = .red
        tblView.insertSubview(customRefreshView, at: 0)
        self.customRefreshView.sendSubview(toBack: tblView)
    }
    
    //MARK:- Scroll view delegate
    func  scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        customRefreshView.containingScrollViewDidEndDragging(scrollView: scrollView)
    }
    
    
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        customRefreshView.containingScrollViewDidEndDragging(scrollView: scrollView)
    }
    
    
    //MARK:- Target and action for the UIControl
    func setTargetAndAction() {
        customRefreshView.addTarget(self, action:#selector(refresh), for: .valueChanged)
    }
    
    
    func refresh() {
        
    }


    //Set the size of table view
    var contentOffsetY:CGFloat = 120
    func tracScrollContent(location: UIScrollView) {
        if(location.contentOffset.y  < -contentOffsetY ) {
            tblView.isScrollEnabled = true
            tblView.bounces = false
            tblView.contentInset = UIEdgeInsets(top: contentOffsetY, left: 0, bottom: 0, right: 0)
        }else if(location.contentOffset.y >= 0 ){
            tblView.bounces = true
            tblView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
    }
}

